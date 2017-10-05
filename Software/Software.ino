#include <SPI.h>
#include <FS.h>
#include <ESP8266WiFi.h>
#include <ArduinoJson.h>
#include <MFRC522.h>

#include "shiftRegister.hpp"
#include "power.hpp"
#include "keys.hpp"
#include "json.hpp"

unsigned long resetTime = 0;

//RFID-Reader Part
#define PIN_UNUSED 100
#define CS 16
MFRC522 mfrc(CS, PIN_UNUSED);

#define DEBUG

void setup(){
  #ifdef DEBUG
    Serial.begin(19200);
    while(!Serial);
  #endif
    
  //PinModes
  pinMode(latchPin, OUTPUT);
  pinMode(clockPin, OUTPUT);
  pinMode(dataPin,  OUTPUT);
  pinMode(powerPin, OUTPUT);

  //MFRC Part
  SPI.begin();
  mfrc.PCD_Init();
  //Just in case
  mfrc.PCD_AntennaOn();
  mfrc.PCD_SetAntennaGain(mfrc.RxGain_max);

  initKeys();

  //Deactivate unused chips until they are needed
  setPowerState(false);

  if(!SPIFFS.begin()){
    #ifdef DEBUG
      Serial.println(F("Could not initialize the Filesystem! Rebooting!"));
    #endif
    ESP.restart();
  }

  //WiFi initialization 
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  while(WiFi.status() != WL_CONNECTED){
    #ifdef DEBUG
      Serial.println(F("Still connecting..."));
    #endif
    delay(50);  
  }
  #ifdef DEBUG
    Serial.println("I'm connected!");
  #endif
  
  //It seems that this is the first time that this particular ESP is started
  if(!SPIFFS.exists("/cards")){
    SPIFFS.format();
    File f = SPIFFS.open("/cards", "w");
    if(!f){
      #ifdef DEBUG
        Serial.println(F("Could not write the file! Rebooting"));
      #endif
      ESP.restart();
    }else{
      f.flush();
      f.close();
    }
  }

  updateCardsAndTime(&resetTime);
}

void loop() {
  if(!mfrc.PICC_IsNewCardPresent())
    return;

  #ifdef DEBUG
    Serial.println(F("New Card found!"));
  #endif

  // Select one of the cards
  if(!mfrc.PICC_ReadCardSerial())
      return;

  byte cardType = mfrc.PICC_GetType(mfrc.uid.sak);            
  //TODO: Check which cards could be used
  switch(cardType){
    case mfrc.PICC_TYPE_MIFARE_MINI:
    case mfrc.PICC_TYPE_MIFARE_1K:
    case mfrc.PICC_TYPE_MIFARE_4K:
    {
      
    }break;
    default:
    {
      #ifdef DEBUG
        Serial.print(F("Unknown card type: "));
        Serial.print(cardType);
        Serial.println(F(" detected. Access rejected!"));
      #endif
      //TODO: Add blinky code!
    }
  }
} 

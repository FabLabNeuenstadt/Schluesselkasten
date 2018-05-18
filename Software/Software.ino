#include <SPI.h>
#include <FS.h>
#include <ESP8266WiFi.h>
#include <ArduinoJson.h>
#include <MFRC522.h>

#include "shiftRegister.hpp"
#include "power.hpp"
#include "keys.hpp"
#include "json.hpp"

//Milliseconds til 4:00 AM
unsigned long resetTime = 0;

#define ReedPin 15

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

  //Power Part
  initKeys();
  setBuzzer(false);
  setRedLed(false);
  setGreenLed(false);
  setLock(false);

  //TODO: Rethink this
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
  
  //Is it time for an update?
  if((resetTime - millis()) >= 0){
    updateCardsAndTime(&resetTime);  
  }
  
  if(!mfrc.PICC_IsNewCardPresent())
    return;

  #ifdef DEBUG
    Serial.println(F("New Card found!"));
  #endif

  // Select one of the cards
  if(!mfrc.PICC_ReadCardSerial())
      return;

  byte cardType = mfrc.PICC_GetType(mfrc.uid.sak);            
  //TODO: Implement 3DES
  switch(cardType){
    case mfrc.PICC_TYPE_MIFARE_MINI:
    case mfrc.PICC_TYPE_MIFARE_1K:
    case mfrc.PICC_TYPE_MIFARE_4K:
    {
      #ifdef DEBUG
        Serial.println(F("It looks like we support this card! Moving on!"));
      #endif
    }break;
    default:
    {
      #ifdef DEBUG
        Serial.print(F("Unknown card type: "));
        Serial.print(cardType);
        Serial.println(F(" detected. Access rejected!"));
      #endif
      setRedLed(true);
      setBuzzer(true);
      delay(BLINK_DELAY);
      setRedLed(false);
      delay(BLINK_DELAY);
      setBuzzer(false);

      return;
    }
  }

  //Upper-Bound for UID-Lengths
  byte uid[10];
  memcpy(uid, mfrc.uid.uidByte, mfrc.uid.size);

  String uidString = "";
  for(byte i = 0; i < mfrc.uid.size; i++){
    uidString += String(uid[i], HEX);
  }

  String tempArr[1];
  tempArr[0] = uidString;

  if(!SPIFFS.exists("/cards/" + uidString)){
    #ifdef DEBUG
      Serial.println(F("Card was not found on the local filesystem! Trying to download it"));
    #endif
    //Shit, we lost the connection!
    if(WiFi.status() != WL_CONNECTED){
      for(byte i = 0; i < 100; i++){
        delay(50);
        if(WiFi.status() != WL_CONNECTED)
          break;
      }

      //Connected?
      if(WiFi.status() != WL_CONNECTED){
        #ifdef DEBUG
          Serial.println(F("Could not connect to the WiFi. Sending blink-code and rebooting afterwards"));  
        #endif
        blinkBeep(2, 0);
        //TODO: Add a nice reset command. This isn't a very nice way of doing it
        mfrc.PCD_AntennaOff();
        delay(100);
        ESP.restart();
      }

      bool known = false;
      //Will this work?
      if(!downloadCards(tempArr, 1, &known)){
        #ifdef DEBUG
          Serial.println(F("Could not connect to the server. Senking Blink-Code and rebooting afterwards!"));
        #endif
        //TODO: Add a nice reset command. This isn't a very nice way of doing it
        delay(100);
        mfrc.PCD_AntennaOff();
        blinkBeep(2, 0);
        ESP.restart();
      }

      //So, the Server does not know our card either... *hiss*
      if(!known){
        #ifdef DEBUG
          Serial.println(F("Server doesn't know the Card either! Halting the card"));
        #endif
        mfrc.PICC_HaltA();
        blinkBeep(3, 1) ;
        return;
      }
    }
  }

  //Card should definetly exist now
  //TODO: Add verification things
  File f = SPIFFS.open("/cards/" + uidString, "r");
  if(!f){
    #ifdef DEBUG
      Serial.println(F("Could not open the specified File!"));
    #endif
    mfrc.PCD_AntennaOff();
    delay(100);
    ESP.restart();
  }

  if(f.size() != FILE_LENGTH){
    #ifdef DEBUG
      Serial.print(F("Something is wrong about this file, it has a length of: "));
      Serial.println(f.size(), DEC);
    #endif
    f.close();
    
    if(!downloadCards(tempArr, 1)){
      #ifdef DEBUG
        Serial.println(F("Something went wrong while downloading the file! Rebooting")); 
      #endif
      ESP.restart();
    }
    return;
  }
  
  char* temp;
  f.readBytes(temp, FILE_LENGTH);

  String fileContent(temp);
  delete(temp); 
  
  char storedData[BLOCK_LENGTH];
  byte allowedKeys[NUM_KEYS];
  MFRC522::MIFARE_Key key;
  memcpy(key.keyByte, fileContent.c_str(), MFRC522::MF_KEY_SIZE);
  memcpy(storedData, fileContent.substring(MFRC522::MF_KEY_SIZE).c_str(), BLOCK_LENGTH);
  memcpy(allowedKeys, fileContent.substring(MFRC522::MF_KEY_SIZE+BLOCK_LENGTH).c_str(), NUM_KEYS);
  //Byte 30 would be a '\0'. Maybe i should remove it from the file?

  if(mfrc.PCD_Authenticate(mfrc.PICC_CMD_MF_AUTH_KEY_B, 1, &key, &mfrc.uid) != mfrc.STATUS_OK){
    
    #ifdef DEBUG
      Serial.println(F("Something went wrong while Authenticating with the Key B. Resetting the card"));
    #endif
    mfrc.PCD_AntennaOff();
    delay(100);
    mfrc.PCD_AntennaOn();
    //Can I use it like that?
    mfrc.PCD_Reset();
    return;
  }

  byte* blockData = NULL;
  byte bufferSize = 18; 
  byte state = mfrc.MIFARE_Read(1, blockData, &bufferSize);
  if(state != mfrc.STATUS_OK){
    #ifdef DB
      Serial.print(F("Something went wrong while reading from the card! Status Code is: "));
      Serial.println(state, HEX);
    #endif
    mfrc.PCD_AntennaOff();
    delay(100);
    mfrc.PCD_AntennaOn();
    mfrc.PCD_Reset();
    return;
  }

  //So, there's is something wrong with the data from the card...
  if(memcmp(storedData, blockData, BLOCK_LENGTH) != 0){
    #ifdef DEBUG
      Serial.println(F("The read information does not match the stored information. Sending a deauth!"));
    #endif
    mfrc.PICC_HaltA();
    blinkBeep(1, 2);
    return;
  }

  updateKeys();

  setLock(true);
  setGreenLed(true);
  delay(1000);
  setLock(false);

  unsigned long opened = millis();
  bool overtimeNotified = false;
  byte oldKeys[NUM_KEYS];
  memcpy(oldKeys, keys, NUM_KEYS);

  specialKey* removedSpecialKeys = new specialKey[numSpecialKeys];
  memcpy(removedSpecialKeys, specialKeys, numSpecialKeys*sizeof(specialKey));
  
  while(!digitalRead(ReedPin)){
    
    //Has the door been open for more than 10 minutes? 
    if(((millis() - opened) > 10*60*1000) && !overtimeNotified){
      setBuzzer(true);
      overtimeNotified = true;
      //TODO: Add Json Post, so that a Telegram Bot can be notified
    }

    
    //Check what keys are plugged in
    updateKeys();
    

    boolean arraysEqual = true;
    for (int i = 0; i < NUM_KEYS; i++) {
	if (oldKeys[i] != keys[i]) {
            arraysEqual = false;
            break;
        }
    }

    if(!arraysEqual){
      byte numAdded = 0;
      byte numRemoved = 0;
      byte added[NUM_KEYS];
      byte removed[NUM_KEYS];
      
      for(byte i = 0; i < NUM_KEYS; i++){
        if(oldKeys[i] == 0 && keys[i] != 0){
          numAdded++;
          added[i] = keys[i];
        }else if(keys[i] == 0 && oldKeys[i] != 0){
          numRemoved++;
          removed[i] = oldKeys[i]; 
        }
      }

      //TODO: Deactivate the timers for replugged keys
      for(byte i = 0; i < numAdded; i++) {

      }

      for(byte i = 0; i < numRemoved; i++){
        if(!checkKeyAllowed(allowedKeys, removed[i])){
          //TODO: Network-Request
          //TODO:Alarm
        }
      }
      
      //TODO: Write removed keys to a file so that the alarm can't be disabled that way!
      //TODO: Add check if the event is allowed for the current user
      //TODO: Setup timer for special cards
    }

    memcpy(oldKeys, keys, NUM_KEYS);
  }

  delete[] removedSpecialKeys;

  mfrc.PICC_HaltA();
  setBuzzer(false);

  #ifdef DEBUG
    Serial.println(ESP.getFreeHeap(), DEC);
  #endif
} 

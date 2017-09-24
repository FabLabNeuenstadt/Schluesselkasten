#include <SPI.h>
#include <MFRC522.h>

#define PIN_UNUSED 100

MFRC522 mfrc(15, PIN_UNUSED);

void setup() {
  #ifdef DEBUG
    Serial.begin(19200);
    while(!Serial);
  #endif

  //MFRC Part
  SPI.begin();
  mfrc.PCD_Init();
  //Just in case
  mfrc.PCD_AntennaOn();


  
}

void loop() {
  // put your main code here, to run repeatedly:

}

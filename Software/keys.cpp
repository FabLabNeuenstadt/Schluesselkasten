#include "keys.hpp"
#include "shiftRegister.hpp"

#include <Arduino.h>
#include <FS.h>

//0 ^= no key
byte keys[NUM_KEYS];

void initKeys(){
  for(byte i = 0; i < NUM_KEYS; i++){
    keys[i] = 0;
  }
}

void updateKeys(){
  for(byte i = 0; i < 9; i++){
    setAnalogAddress(i);
    unsigned short value = analogRead(A0);

    value = map(value, 0, 1023, 0, NUM_KEYS);
    keys[i] = (byte) value;
  }
}


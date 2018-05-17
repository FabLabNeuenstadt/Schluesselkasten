#ifndef KEYS_HPP
#define KEYS_HPP

#define NUM_KEYS 9

#include <Arduino.h>

typedef struct{
  //TODO: Check if i can make this const!
  byte keyNumber;
  //Max time is in seconds (int just in case)
  int maxTime;
} specialKey;

extern byte keys[NUM_KEYS];

extern specialKey* specialKeys;
extern byte numSpecialKeys;

void initKeys();
void updateKeys();
//Annahme: length of allowedKeys == 8
bool checkKeyAllowed(byte* allowedKeys, byte keyNumber);

#endif

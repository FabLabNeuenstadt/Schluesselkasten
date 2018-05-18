#ifndef KEYS_HPP
#define KEYS_HPP

#include <Arduino.h>
#include <MFRC522.h>

#define NUM_KEYS 9

#define BLOCK_LENGTH 16 
#define FILE_LENGTH NUM_KEYS + BLOCK_LENGTH + MFRC522::MF_KEY_SIZE

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

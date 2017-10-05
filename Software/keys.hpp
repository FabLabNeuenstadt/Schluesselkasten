#ifndef KEYS_HPP
#define KEYS_HPP

#define NUM_KEYS 9

#include <Arduino.h>

extern byte keys[NUM_KEYS];

void initKeys();
void updateKeys();

#endif

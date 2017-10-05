#ifndef SHIFT_REGISTER_HPP
#define SHIFT_REGISTER_HPP

#include <Arduino.h>
#define latchPin 0
#define clockPin 2
#define dataPin 5

extern byte shiftRegister;

void shiftData();

bool setAnalogAddress(byte channel);
void setBuzzer(bool state);
void setLock(bool state);
void setRedLed(bool state);
void setGreenLed(bool state);
#endif

#ifndef SHIFT_HPP
#define SHIFT_HPP
#include <Arduino.h>

extern byte shiftData;
void shift();

//Coils
void startBuzzer();
void stopBuzzer();
void lockDoor();
void unlockDoor();

//LEDs
void turnGreenOn();
void turnGreenOff();
void turnRedOn();
void turnRedOff();

//Analog-Multiplexer
void setAnalogAddress(byte channel);

#endif

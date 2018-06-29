#include "shift.hpp"
#include "const.hpp"

byte shiftData = 0;

void shift() {
  digitalWrite(LATCH_PIN, LOW);
  shiftOut(DATA_PIN, CLOCK_PIN, MSBFIRST, shiftData);
}

void startBuzzer() {
  shiftData |= B00010000;
  shift();
}

void stopBuzzer() {
  shiftData &= ~(B00010000);
  shift();
}

void lockDoor() {
  shiftData |= B00100000;
  shift();
}

void unlockDoor() {
  shiftData &= ~(B00100000);
  shift();
}

void turnRedOn() {
  shiftData |= B01000000;
  shift();
}

void turnRedOff() {
  shiftData &= ~(B01000000);
  shift();
}

void turnGreenOn() {
  shiftData |= B10000000;
  shift();
}

void turnGreenOff() {
  shiftData &= ~(B10000000);
  shift();
}


void setAnalogAddress(byte channel) {
  channel &= B00001111;
  shiftData &= B11110000;
  shiftData |= channel;
  shift();
}

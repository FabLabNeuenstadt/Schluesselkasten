#include "power.hpp"
#include <Arduino.h>

bool powerState = false;

void setPowerState(bool state){
  powerState = state;
  digitalWrite(powerPin, !powerState);
}

#include <Arduino.h>
#include "const.hpp"
#include "error.hpp"
#include "shift.hpp"

const long errorDelay = 300;

void handleError(errorCode code) {
  switch(code) {
    case Ok: {
    }break;
    case WiFiFailed: {
      turnRedOn();
      delay(errorDelay);
      turnRedOff();
      delay(errorDelay);
      errorFinished();
      ESP.restart();
    }break;
    case DoorOpen: {
      do {
        startBuzzer();
        delay(errorDelay);
        stopBuzzer();
        delay(errorDelay);
        errorFinished();
      } while(!digitalRead(REED_PIN));
    }break;
    default: {

    }
  }
}

void errorFinished() {
  turnGreenOn();
  delay(errorDelay);
  turnGreenOff();
  delay(errorDelay);
}

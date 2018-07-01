#include <Arduino.h>
#include "shift.hpp"
#include "error.hpp"

const long errorDelay = 300;

void handleError(errorCode code) {
  switch(code) {
    case WiFi_Failed: {
      turnRedOn();
      delay(errorDelay);
      turnRedOff();
      delay(errorDelay);
      ESP.restart();
    }break;
    default: {

    }
  }
}

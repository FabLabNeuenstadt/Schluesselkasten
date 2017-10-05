#ifndef JSON_HPP
#define JSON_HPP

#include <ArduinoJson.h>

//Dirty fix
#include "config.hpp"

void jsonPost(StaticJsonBuffer<maxCheckSize>* jsonBuffer, JsonObject* response);
void updateCardsAndTime(unsigned long* timeReset);
void writeCardValues(JsonVariant variant);

#endif

#ifndef JSON_HPP
#define JSON_HPP

#include <ArduinoJson.h>

//Dirty fix
#include "config.hpp"

typedef struct{
  String uid;
  String content;
} card;

void jsonPost(StaticJsonBuffer<maxCheckSize>* jsonBuffer, JsonVariant* response);
void downloadCards(String* uids, unsigned int uidLength);
void downloadCards(StaticJsonBuffer<maxCheckSize>* jsonBuffer, String* uids, unsigned int uidLength);
void updateCardsAndTime(unsigned long* timeReset);
void writeCardValues(card* cards, unsigned int length);

#endif

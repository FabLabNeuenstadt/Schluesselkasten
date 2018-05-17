#ifndef JSON_HPP
#define JSON_HPP

#include <ArduinoJson.h>

#include "config.hpp"

typedef struct{
  String uid;
  String content;
} card;

bool jsonPost(StaticJsonBuffer<BufferSize>* jsonBuffer, JsonVariant* response);
bool downloadCards(String* uids, unsigned int uidLength, bool* known = NULL);
bool downloadCards(StaticJsonBuffer<BufferSize>* jsonBuffer, String* uids, unsigned int uidLength, bool* known = NULL);
bool updateSpecialKeys(StaticJsonBuffer<BufferSize>* jsonBuffer);
bool updateSpecialKeys();
void updateCardsAndTime(unsigned long* timeReset);
void writeCardValues(card* cards, unsigned int length);

#endif

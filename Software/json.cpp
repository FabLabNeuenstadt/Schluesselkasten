#include <FS.h>
#include <ESP8266HTTPClient.h>

//WiFi-stuff
HTTPClient http;

#include "json.hpp"

//Push a json request to the server and handle the response!
void jsonPost(StaticJsonBuffer<maxCheckSize>* jsonBuffer, JsonVariant response){
  
  http.begin(host, port, uri + apiKey, fingerprint);
  String jsonString;
  response.printTo(jsonString);
  int httpCode = http.POST(jsonString);
  //Clear
  
  jsonBuffer->clear();
  jsonString = "";

  //Make this recurring part it's own function
  
  //Receive response
  if(httpCode < 0){
    #ifdef DEBUG
      Serial.println(F("Something went wrong while sending the POST request"));
    #endif
    ESP.restart();
  }else{
    if(httpCode == HTTP_CODE_OK) {
      jsonString = http.getString();
      #ifdef DEBUG
        Serial.println(jsonString);
      #endif
      response = jsonBuffer->parseObject(jsonString);
      jsonString = "";

      if(!response.success()){
        #ifdef DEBUG
          Serial.println(F("Something went wrong while parsing the JSON-Response!"));
        #endif
        ESP.restart();
      }
    }else{
      #ifdef DEBUG
        Serial.println(F("Something went wrong while sending the POST request"));
        Serial.print(F("Status Code: "));
        Serial.println(httpCode);
      #endif  
      ESP.restart();
    }
  }
  http.end();
}

//Check time and time and update them accordingly
void updateCardsAndTime(unsigned long* resetTime){
  
  StaticJsonBuffer<maxCheckSize> jsonBuffer;
  
  //Create the sync-object
  //Maybe-TODO: make the sending flexible(eg. because of more cards). Not really needed
  JsonVariant object = jsonBuffer.createObject();
  //c ^= command, checkL ^= check list
  object["c"] = "checkL";
  JsonVariant cards = object.as<JsonObject>().createNestedArray("list");
  
  Dir dir = SPIFFS.openDir("/cards");
  while(dir.next()){
      String name = dir.fileName();
      if((maxCheckSize - jsonBuffer.size()) <= name.length()){
        cards.as<JsonArray>().add(name);
      }else{
        break;
      }
  }

  http.addHeader(F("Content-Type:"), F("application/json"), false, true); 

  jsonPost(&jsonBuffer, object);

  #ifdef DEBUG
    Serial.println(F("Sent the list of currently stored cards to the server"));
  #endif

  //TODO: Migrate the add list to another array
  JsonArray& add    = object["add"];
  JsonArray& del    = object["del"];
  *resetTime         = object.as<JsonObject>().get<unsigned long>("time");    
  
  //TODO: Remove the specified files  
  //Start at the beginning
  dir = SPIFFS.openDir("/cards");
  size_t length = del.size();
  while(dir.next()){
    String name = dir.fileName();
    for(size_t i = 0; i < length; i++){
      if(name.equals(del.get<String>(i))){
        SPIFFS.remove("/cards/" + name);
        #ifdef DEBUG
          Serial.print(F("Removed the card-file: /cards/"));
          Serial.println(name);
        #endif
      }
    }
  }

  length = add.size();
  String* addFiles = new String[add.size()];
  for(size_t i = 0; i < length; i++){
    *(addFiles + i) = add.get<String>(i);  
  }

  jsonBuffer.clear();
  object = jsonBuffer.createObject();
  //checkC ^= check content
  object["c"] = "checkC";
  cards = object.as<JsonObject>().createNestedArray("list");

  dir = SPIFFS.openDir("/cards");
  //Create an array with the content with the old files
  while(dir.next()){
    String name = dir.fileName();
    File f = SPIFFS.open("/cards/" + name, "r");

    String content = "";
    //Will this really work?
    content = f.readString();
    f.close();
      
    cards.as<JsonArray>().add(content.c_str());
  }
  
  jsonPost(&jsonBuffer, object);

  //Do shit
  cards  = object["list"];

  //tie the two lists together
  String* temp = new String[length+cards.size()];
  for(size_t i = 0; i < length; i++){
    *(temp+i) = *(addFiles+i);
  }
  delete(addFiles);
  addFiles = temp;
  for(size_t i = length; i < length+cards.size(); i++){
    *(temp+i) = cards.as<JsonArray>().get<String>(i-length);
  }
  length+=cards.size();
  jsonBuffer.clear();

  //Download and write the specified cards
  downloadCards(&jsonBuffer, addFiles, length);
  
  delete(addFiles);
  jsonBuffer.clear();
}

void writeCardValues(card* cards, unsigned int length){
  for(unsigned int i = 0; i < length; i++){
    card temp = *(cards+i);
    File f = SPIFFS.open("/cards/" + temp.uid, "w");
    //TODO: Check this fucking shit!
    f.print(temp.content);
    f.flush();
    f.close();
  }
  delete(cards);
}

//TODO: Replace int with short
void downloadCards(String* uids, unsigned int uidLength){
  StaticJsonBuffer<maxCheckSize> jsonBuffer;
  downloadCards(&jsonBuffer, uids, uidLength);
}

//TODO: Rework this crap!
void downloadCards(StaticJsonBuffer<maxCheckSize>* jsonBuffer, String* uids, unsigned int uidLength){
  JsonVariant object = jsonBuffer->createObject();
  //Download the specified files from the server
  object["c"] = "downL";
  JsonArray&  uid    = object.as<JsonObject>().createNestedArray("uids");
  
  for(unsigned int i = 0; i < uidLength; i++){
    uid.add(*(uids+i));
  }

  jsonPost(jsonBuffer, object);
  JsonObject& response = object["list"];
  size_t size = response.size();
  card* cards = new card[size];
  unsigned int i = 0;
  for(auto elem : response){
     card uid;
     uid.uid = elem.key;
     uid.content = elem.value.as<String>();
     *(cards+i) = uid;
     i++;
  }
  writeCardValues(cards, i);
  jsonBuffer->clear();
}

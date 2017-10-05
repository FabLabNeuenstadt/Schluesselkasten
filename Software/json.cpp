#include <FS.h>
#include <ESP8266HTTPClient.h>

//WiFi-stuff
HTTPClient http;

#include "json.hpp"

void jsonPost(StaticJsonBuffer<maxCheckSize>* jsonBuffer, JsonObject* response){
}

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
  http.begin(host, port, uri + apiKey, fingerprint);
  String jsonString;
  object.printTo(jsonString);
  int httpCode = http.POST(jsonString);
  
  #ifdef DEBUG
    Serial.println(F("Sent the list of currently stored cards to the server"));
  #endif
  
  //Clear
  jsonBuffer.clear();
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
      object = jsonBuffer.parseObject(jsonString);
      jsonString = "";

      if(!object.success()){
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
  
  http.begin(host, port, uri + apiKey, fingerprint);
  object.printTo(jsonString);
  httpCode = http.POST(jsonString);

  jsonBuffer.clear();

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
      object = jsonBuffer.parseObject(jsonString);
      jsonString = "";

      if(!object.success()){
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

  writeCardValues(object);
  jsonBuffer.clear();

  object = jsonBuffer.createObject();
  //Download the specified files from the server
  object["c"] = "downL";
  cards = object.as<JsonObject>().createNestedArray("list");

  for(size_t i = 0; i < length; i++){
    cards.as<JsonArray>().add(*(addFiles + i));
  }

  http.begin(host, port, uri + apiKey, fingerprint);
  object.printTo(jsonString);
  httpCode = http.POST(jsonString);

  jsonBuffer.clear();

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
      object = jsonBuffer.parseObject(jsonString);
      jsonString = "";

      if(!object.success()){
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

  writeCardValues(object);
  jsonBuffer.clear();
}

void writeCardValues(JsonVariant variant){
  JsonVariant cards = variant["list"];
  for(auto elem : cards.as<JsonObject>()){
    //I'm lazy ;P
    File f = SPIFFS.open("/cards/" + String(elem.key), "w");
    //TODO: Check this fucking shit!
    f.print(elem.value.as<String>());
    f.flush();
    f.close();
  }
}


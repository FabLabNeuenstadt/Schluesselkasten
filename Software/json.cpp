#include <FS.h>
#include <ESP8266HTTPClient.h>

#include "keys.hpp"

//WiFi-stuff
HTTPClient http;

#include "json.hpp"

specialKey* specialKeys = NULL;
byte numSpecialKeys     = 0;


//Push a json request to the server and handle the response!
bool jsonPost(StaticJsonBuffer<BufferSize>* jsonBuffer, JsonVariant response){

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
    return false;
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
        return false;
      }
    }else{
      #ifdef DEBUG
        Serial.println(F("Something went wrong while sending the POST request"));
        Serial.print(F("Status Code: "));
        Serial.println(httpCode);
      #endif  
      return false;
    }
  }
  http.end();
  return true;
}

//Check time and time and update them accordingly
void updateCardsAndTime(unsigned long* resetTime){
  
  StaticJsonBuffer<BufferSize> jsonBuffer;

  //Update the keys
  updateSpecialKeys(&jsonBuffer);
  jsonBuffer.clear();
  
  File f = SPIFFS.open("/keys", "r");
  String fileContent = f.readString();
  byte numberOfLines = 0;
  size_t lastIndex     = 0;
  while(true){
    int temp = fileContent.indexOf('\n', lastIndex);
    numberOfLines++;
    if(temp != -1){
      lastIndex = temp;  
    }else{
      break;
    }
  }

  if(specialKeys != NULL)
    delete[] specialKeys;

  //Fill the special key array

  specialKeys = new specialKey[numberOfLines];
  numSpecialKeys = numberOfLines;
  for(byte i = 0; i < numberOfLines; i++){
    int index = fileContent.indexOf('\n');
    String temp = "";
    if(index != -1){
      temp = fileContent.substring(0, index);
      fileContent  = fileContent.substring(index+1);
    }else{
      temp = fileContent;
    }
    index = temp.indexOf(":");
    //TODO:Cleanup this crap! I hope this won't break!
    specialKey fix;
    fix.keyNumber = (byte)temp.substring(index+1).toInt();
    fix.maxTime   = (int)temp.substring(0, index).toInt();
    *(specialKeys+i) = fix;
  }
    
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

  bool response = jsonPost(&jsonBuffer, object);
  if(!response)
    ESP.restart();


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
  
  response = jsonPost(&jsonBuffer, object);
  if(!response)
    ESP.restart();

  //Do shit
  cards  = object["list"];

  //tie the two lists together
  String* temp = new String[length+cards.size()];
  for(size_t i = 0; i < length; i++){
    *(temp+i) = *(addFiles+i);
  }
  delete[] addFiles;
  addFiles = temp;
  for(size_t i = length; i < length+cards.size(); i++){
    *(temp+i) = cards.as<JsonArray>().get<String>(i-length);
  }
  length+=cards.size();
  jsonBuffer.clear();

  //Download and write the specified cards
  response = downloadCards(&jsonBuffer, addFiles, length);
  if(!response)
    ESP.restart();
  
  delete[] addFiles;
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
  delete[] cards;
}

//TODO: Replace int with short
bool downloadCards(String* uids, unsigned int uidLength, bool* known /* = known */){
  StaticJsonBuffer<BufferSize> jsonBuffer;
  return downloadCards(&jsonBuffer, uids, uidLength);
}

//TODO: Rework this crap!
bool downloadCards(StaticJsonBuffer<BufferSize>* jsonBuffer, String* uids, unsigned int uidLength, bool* known /* = known */){
  JsonVariant object = jsonBuffer->createObject();
  //Download the specified files from the server
  object["c"] = "downL";
  JsonArray&  uid    = object.as<JsonObject>().createNestedArray("uids");
  
  for(unsigned int i = 0; i < uidLength; i++){
    uid.add(*(uids+i));
  }

  bool responseVal = jsonPost(jsonBuffer, object);
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

  if(known != NULL){
    if(size == 0){
      *known = false;
    }else{
      *known = true;
    }
  }

  return responseVal;
}

bool updateSpecialKeys(){
  StaticJsonBuffer<BufferSize> jsonBuffer;
  return updateSpecialKeys(&jsonBuffer);
}

bool updateSpecialKeys(StaticJsonBuffer<BufferSize>* jsonBuffer){
  JsonVariant object = jsonBuffer->createObject();
  //downK ^= download Keys
  object["c"] = "downK";
  bool response = jsonPost(jsonBuffer, object);  
  if(!response){
    return false;
  }

  JsonArray& list = object["list"];
  String jsonContent = "";

  for(size_t i = 0; i < list.size(); i++){
    jsonContent += list.get<String>(i);
    if(i < list.size()-2)
      jsonContent += '\n';
  }

  if(!SPIFFS.exists("/keys")){
    #ifdef DEBUG
      Serial.println(F("Keys file wasn't found! Just writing the response"));
    #endif
    File f = SPIFFS.open("/keys", "w");
    f.print(jsonContent);
    f.flush();
    f.close();
  }
  File f = SPIFFS.open("/keys", "r");
  String fileContent = f.readString();
  f.close();

  //Not perfect, but well, if the keys are updated two times per month (unrealistic, won't be so often), but still: about 8192 years(!) possible with the same Flash chip, so it shouldn't be a problem
  if(!jsonContent.equals(fileContent)){
    File f = SPIFFS.open("/keys", "w");
    f.print(jsonContent);
    f.flush();
    f.close();
  }
  return response;
}

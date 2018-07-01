#ifndef CONFIG_HPP
#define CONFIG_HPP
#include <Arduino.h>

//Only used for debugging
extern const long baudrate;

//WiFi-Configuration
extern const char* ssid;
extern const char* password;

//Command&Database-Configuration
//Fingerprint of Server-Certificate
extern const char* fingerprint;
extern const char* host;
extern const uint16_t port;
extern const char* uri;
extern const char* apiKey;

//OTA-Update(Unused when OTA is not included)
#ifdef __ARDUINO_OTA_H
  extern const char* otaName;
  extern const char* otaPassword;
#endif

#endif

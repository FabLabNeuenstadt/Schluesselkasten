#include <ESP8266WiFi.h>
#include "wifi.hpp"
#include "config.hpp"
#include "debug.hpp"

bool connectWiFi() {
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  return connectedWiFi();
}

bool connectedWiFi() {
  for (int i = 0; i < 80; i++) {
    if (WiFi.status() == WL_CONNECTED) {
      LOG("Connected to WiFi");
      return true;
    }

    delay(50);
  }

  LOG("Connection to WiFi failed")
  return false;
}

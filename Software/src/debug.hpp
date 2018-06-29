#ifndef DEBUG_HPP
#define DEBUG_HPP

#ifdef DEBUG
  #define INIT_SERIAL(x) Serial.begin(x);
  #define LOG(x) Serial.println(x);
#else
  #define INIT_SERIAL(x)
  #define LOG(x)
#endif

#endif

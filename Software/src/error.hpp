#ifndef ERROR_HPP
#define ERROR_HPP

extern const long errorDelay;

enum errorCode {
  Ok = 0,
  WiFi_Failed = 1,
};

void handleError(errorCode error);

#endif

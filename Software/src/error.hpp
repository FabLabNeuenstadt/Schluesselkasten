#ifndef ERROR_HPP
#define ERROR_HPP

extern const long errorDelay;

enum errorCode {
  Ok = 0,
  WiFiFailed = 1,
  DoorOpen = 2,
};

void handleError(errorCode error);
void errorFinished();

#endif

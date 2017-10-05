#include "shiftRegister.hpp"

byte shiftRegister = 0;

//Shift Register functions
void shiftData(){
  digitalWrite(latchPin, LOW);
  shiftOut(dataPin, clockPin, MSBFIRST, shiftRegister);
  digitalWrite(latchPin, HIGH);
}

bool setAnalogAddress(byte channel){
  if(channel > 15){
    return false;
  }else{
    shiftRegister &= B0000;
    shiftRegister |= channel;
    shiftData();
  }
}

void setBuzzer(bool state){
  if(state){
    shiftRegister |= (1 << 4);          
  }else{
    shiftRegister &= ~(1 << 4);
  }  
  shiftData();
}

void setLock(bool state){
  if(state){
    shiftRegister |= (1 << 5);          
  }else{
    shiftRegister &= ~(1 << 5);
  }  
  shiftData();
}

void setRedLed(bool state){
  if(state){
    shiftRegister |= (1 << 6);          
  }else{
    shiftRegister &= ~(1 << 6);
  }  
  shiftData();
}

void setGreenLed(bool state){
  if(state){
    shiftRegister |= (1 << 7);          
  }else{
    shiftRegister &= ~(1 << 7);
  }  
  shiftData();
}

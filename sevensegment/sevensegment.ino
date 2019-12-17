#include "Sevseg.h"
char input;
Sevseg sevseg(12,11,10,9,8,7,6);
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available()){
    input = Serial.read();
    if(input!='\n'){
      sevseg.number(input);
    }
  }
}

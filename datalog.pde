  
// Example by Tom Igoe

import processing.serial.*;
int xpos;
int hr;
int phr;
// The serial port:
Serial myPort;

void setup() {
  printArray(Serial.list());
  size(600, 400);
  background(0);
  frameRate(1000);
  myPort = new Serial(this, "com16", 9600);
}

void draw() {
  while (myPort.available() > 0) {
    String inString = myPort.readStringUntil('\n');
    if (inString != null) {
      inString = trim(inString);
      // convert to an int
      println(inString);
      int currentHeartrate = int(inString);
      hr = int(map(currentHeartrate, 1023, 0, 0, height));
      stroke(0, 0, 0);
      line(xpos, 0, xpos, height);
      stroke(0, 255, 0);
      line(xpos - 1, phr, xpos, hr);
      phr = hr;
      fill(0,0,0);
      stroke(0, 0, 0);
      rect(580, 0, 599, 400);
      stroke(0, 0, 255);
      fill(0,0,255);
      rect(580, hr, 599, 400);
      if (xpos >= 400){
        xpos = 0;
      }else{
        xpos ++;
      }
    }
  }
}

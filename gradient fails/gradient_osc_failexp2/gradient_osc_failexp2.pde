// Choose between RGB and HSB.

import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress iPad; 

int x=0;

float r = 0.0f;
float g = 0.0f;
float b = 0.0f;

int colorMode = RGB;

// These are the two colors we want to use, in RGBA order.
color blue = color(159, 218, 231, 255);
color yellow = color(255, 208, 5, 255);


void setup(){
  size(512, 256);
  background(255);

 oscP5 = new OscP5(this,8000); 
 iPad = new NetAddress("192.168.0.2",8000);

}

void draw(){

// These define the four edges of the square.
int left = 0;
int top = 0;
int right = width;
int bottom = height;

// These will be used in the for-loop.
color currentStroke = blue;
float step = 0;

// Start at the top of the rectangle.
// Add one until the bottom is reached.
for (int i = top; i <= bottom; ++i) {

  // Convert the loop's i counter to a range between
  // 0 and 1 (0 .. 100%).
  step = map(i, top, bottom, 0.0, 1.0);

  // Linear interpolation. interpolate from blue to yellow, amt to float between = colorMode
  currentStroke = lerpColor(blue, yellow, step, colorMode);
  stroke(currentStroke);

  // Syntax is line(startx, starty, endx, endy).
  line(left, i, right, i);
  
}
}


void oscEvent(OscMessage theOscMessage){
  
  String addr = theOscMessage.addrPattern();
  int val = theOscMessage.get(0).intValue();
  
  if(addr.equals("/1/red")){ 
    r = val;
      }
  if(addr.equals("/1/green")){ 
    g = val;
      }
  if(addr.equals("/1/blue")){ 
    b = val;
      }
      
   println(r,g,b);
}


import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress iPad; 

float r = 0.0f;
float g = 0.0f;
float b = 0.0f;

//Gradient variables
int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2;
 

void setup () {
  
  size(300, 600);
  background(0);
  colorMode(RGB);
  
  oscP5 = new OscP5(this,8000); 
  iPad = new NetAddress("192.168.0.2",8000);
 
  // Define colors
  b1 = color(255,208,5);
  b2 = color(159,218,231);
 
}
 
void draw () {
 
 
  // GRADIENT
  setGradient(0, 0, width, height, b1, b2, Y_AXIS);
}

 
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {
  noFill();
 
  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  } else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}

void oscEvent(OscMessage theOscMessage){
  
  String addr = theOscMessage.addrPattern();
  float val = theOscMessage.get(0).floatValue();
  
  if(addr.equals("/1/red")){ 
    r = val;
      }
  if(addr.equals("/1/green")){ 
    g = val;
      }
  if(addr.equals("/1/blue")){ 
    b = val;
      }
   
   //println(r,g,b);
   println(b1);
      
}

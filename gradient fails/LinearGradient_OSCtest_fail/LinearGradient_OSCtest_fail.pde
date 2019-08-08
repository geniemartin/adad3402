import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress iPad; 


// Constants
int Y_AXIS = 1;
int X_AXIS = 2;
//color c1, c2;
int c1, c2;

void setup() {
  size(640, 360);

  oscP5 = new OscP5(this,8000); 
  iPad = new NetAddress("192.168.0.2",8000);
  
  // Define colors
  //c1 = color(204, 102, 0);
  //c2 = color(0, 102, 153);

  noLoop();
}

void draw() {
  // Background
  setGradient(0, 0, 640, 360, c2, c1, X_AXIS);
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
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
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
  int firstValue = theOscMessage.get(0).intValue();  
  
  if(addr.equals("/1/red")){ 
    c1 = firstValue;
      }

   
  println(c1,c2);
}

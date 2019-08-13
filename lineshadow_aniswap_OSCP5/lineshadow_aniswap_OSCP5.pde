import netP5.*;
import oscP5.*;

OscP5 oscP5;

NetAddress iPad; 

Animation animation1, animation2;

float changeAni = 0.0f;

void setup() {
  size(1440, 900);
  background(255, 204, 0);
  frameRate(24);
  animation1 = new Animation("plantframe_line", 18);
  animation2 = new Animation("plantframe_shadow", 18);
  
  oscP5 = new OscP5(this,8000); 
  iPad = new NetAddress("192.168.0.3",8000);
}

void oscEvent(OscMessage theOscMessage){
  
  String addr = theOscMessage.addrPattern();
  float val = theOscMessage.get(0).floatValue();

  if(addr.equals("/1/push1")){ 
    changeAni = val;
      }
   
}

void draw() { 


  // Display the sprite at the position xpos, ypos
  if (changeAni == 1) {
    background(153, 153, 0);
    animation1.display();
  } else {
    background(255, 204, 0);
    animation2.display();
  }
}

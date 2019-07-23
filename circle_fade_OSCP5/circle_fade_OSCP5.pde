import netP5.*;
import oscP5.*;

OscP5 oscP5;

NetAddress iPad; 

float xBallPos = 0.0f;
float yBallPos = 0.0f;
float resetFade = 0.0f;

void setup() {
  size(1000, 600);
  background(203,157,255);
  
   oscP5 = new OscP5(this,8000);
   iPad = new NetAddress("192.168.0.3",8000);

}

void draw() {
  noStroke();
  fill(0,144,102);
  ellipse(xBallPos, yBallPos, 50, 50);
  //ellipse(mouseX, mouseY, 50, 50);
  filter(BLUR, 0.58);
  
  if (resetFade == 1) {
  noStroke();
  fill(203,157,255);
  rect(0,0,1000,600);
  }
 
}

void oscEvent(OscMessage theOscMessage){
  String addr = theOscMessage.addrPattern();
  float val = theOscMessage.get(0).floatValue();
  
  if(addr.equals("/1/xPos")){ 
    yBallPos = val;
      }
      
  if(addr.equals("/1/yPos")){ 
    xBallPos = val;
      }
      
  if(addr.equals("/1/push1")){ 
    resetFade = val;
      }
 
}

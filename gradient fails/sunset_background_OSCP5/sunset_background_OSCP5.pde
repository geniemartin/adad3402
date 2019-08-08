import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress iPad; 

int redAmount = 0;
int greenAmount = 0;
int blueAmount = 0;
int darkness;

void setup(){
  size(1400,850);
 colorMode(RGB);
  background(0);

  oscP5 = new OscP5(this,8000); 
  iPad = new NetAddress("192.168.0.2",8000);
}

void draw(){
  background(redAmount, greenAmount, blueAmount);
  
  noStroke();
  fill(0,0,0, darkness);
  rect(0,0,1400,850);

  
}

//create Osc object - each time processing recieves an osc message it will run this event
void oscEvent(OscMessage theOscMessage){
  
  String addr = theOscMessage.addrPattern();
  int val = theOscMessage.get(0).intValue();
  
  if(addr.equals("/1/red")){ 
    redAmount = val;
      }
  if(addr.equals("/1/green")){ 
    greenAmount = val;
      }
  if(addr.equals("/1/blue")){ 
    blueAmount = val;
      }
   if(addr.equals("/1/darkness")){ 
    darkness = val;
      }
      
   println(redAmount, blueAmount, greenAmount);
   //println(greenAmount);
   //println(blueAmount);
  
}
  

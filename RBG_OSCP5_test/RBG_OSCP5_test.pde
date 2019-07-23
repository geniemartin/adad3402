import netP5.*;
import oscP5.*;

OscP5 oscP5;
/* a NetAddress contains the ip address and port number of a remote location 
in the network. */
NetAddress iPad; 

float redAmount = 0.0f;
float greenAmount = 0.0f;
float blueAmount = 0.0f;

void setup(){
  size(320,400);
  background(0);
  
  /* create a new instance of oscP5. 
   * 8000 is the port number you are listening for incoming osc messages.
   */
  oscP5 = new OscP5(this,8000); //port number it talks to, match up on ipad
  /* create a new NetAddress. a NetAddress is used when sending osc messages
   * with the oscP5.send method.
   */
  
  /* the address of the osc broadcast server */
  iPad = new NetAddress("192.168.05",8000);
}

void draw(){
  background(redAmount, greenAmount, blueAmount);
  
  noFill();
  //red rect
  stroke(255,0,0);
  rect(34,39,67,255);
 
  rect(34,39+255,67,-redAmount);
  
  //green rect
  stroke(0,255,0);
  rect(124,39,67,255);
  
  rect(124,39+255,67,-greenAmount);
  
  //blue rect
  stroke(0,0,255);
  rect(216,39,67,255);
  
  rect(216,39+255,67,-blueAmount);
  
}

//create Osc object - each time processing recieves an osc message it will run this event
void oscEvent(OscMessage theOscMessage){
  
  String addr = theOscMessage.addrPattern();
  float val = theOscMessage.get(0).floatValue();
  
  if(addr.equals("/1/red")){ 
    redAmount = val;
      }
  if(addr.equals("/1/green")){ 
    greenAmount = val;
      }
  if(addr.equals("/1/blue")){ 
    blueAmount = val;
      }
  
}
  

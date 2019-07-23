import netP5.*;
import oscP5.*;

OscP5 oscP5;
/* a NetAddress contains the ip address and port number of a remote location 
in the network. */
NetAddress iPad; 

//SUNSET VARS
float sunset = 0.0f;



void setup(){
  size(1000,600);
  background(250);
  
  /* create a new instance of oscP5. 
   * 8000 is the port number you are listening for incoming osc messages.
   */
  oscP5 = new OscP5(this,8000); //port number it talks to, match up on ipad
  /* create a new NetAddress. a NetAddress is used when sending osc messages
   * with the oscP5.send method.
   */
  
  /* the address of the osc broadcast server */
  iPad = new NetAddress("192.168.3",8000);
}

void draw(){
  
  //SUNSET
  noStroke();
  fill(255, 172, sunset);
  //rect(x-coord, -y-ccord, width, height)
  rect(20,20,470,270);
  
}

//create Osc object - each time processing recieves an osc message it will run this event
void oscEvent(OscMessage theOscMessage){
  
  String addr = theOscMessage.addrPattern();
  float val = theOscMessage.get(0).floatValue();

  //SUNSET
  if(addr.equals("/1/fader7")){ 
    sunset = val;
      }
   
}
  

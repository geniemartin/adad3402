import netP5.*;
import oscP5.*;

OscP5 oscP5;
/* a NetAddress contains the ip address and port number of a remote location 
in the network. */
NetAddress iPad; 

//SUNSET VARS
float sunset = 0.0f;

//BALL FADE VARS
float xBallPos = 0.0f;
float yBallPos = 0.0f;
float resetFade = 0.0f;


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
  iPad = new NetAddress("192.168.05",8000);
}

void draw(){
  
  //SUNSET
  noStroke();
  fill(255, 172, sunset);
  //rect(x-coord, -y-ccord, width, height)
  rect(20,20,470,270);
  
  //BALLS FADE
  
  //noStroke(); //background rect
  //fill(203,157,255);
  //rect(510,310,470,270);
  
  noStroke();
  fill(0,144,102);
  ellipse(xBallPos, yBallPos, 20, 20);
  filter(BLUR, 0.58);
  
  if (resetFade == 1) {
  noStroke();
  fill(203,157,255);
  rect(510,310,470,270);
  }
  
  
}

//create Osc object - each time processing recieves an osc message it will run this event
void oscEvent(OscMessage theOscMessage){
  
  String addr = theOscMessage.addrPattern();
  float val = theOscMessage.get(0).floatValue();

  //SUNSET
  if(addr.equals("/1/fader7")){ 
    sunset = val;
      }
   
  //BALLS FADE
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
  

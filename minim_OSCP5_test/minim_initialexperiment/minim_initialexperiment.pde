
import ddf.minim.*;

Minim minim;
AudioSample player_s1;
AudioSample player_s2;

//TOUCH OSC  
import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress iPad; 

float sound1 = 0.0f;
float sound2 = 0.0f;


void setup()
{
  size(512, 200, P3D);
  
  minim = new Minim(this);
  
 
  player_s1 = minim.loadSample("1.wav", 512);
  player_s2 = minim.loadSample("2.wav", 512);
  //player.play();
  
  //ambient_backing = minim.loadFile("BACKING.wav");
  //ambient_backing.loop();
  
  // OSC CONNECTION 
  oscP5 = new OscP5(this,8000); 
  iPad = new NetAddress("192.168.0.7",8000);
}

void draw(){
  background(255);
  fill(255,0,0);
  rect(25,25,50,50);


  fill(0,0,255);
  rect(125,25,50,50);
  
   println(sound1, sound2);
   
  if(sound1 == 1.0){
  player_s1.trigger();
  
  }else if(sound2 == 1.0){
  player_s2.trigger();
  }
  
}



void oscEvent(OscMessage theOscMessage){
  
  String addr = theOscMessage.addrPattern();
  float val = theOscMessage.get(0).floatValue();

//GRADIENT VARIABLES
  if(addr.equals("/y/sound1")){ 
    sound1 = val;
      }
   
     if(addr.equals("/y/sound2")){ 
    sound2 = val;
      }
      
}

//MINIM
import ddf.minim.*;

Minim minim;
AudioSample player_s1;
AudioSample player_s2;
AudioSample player_s3;
AudioSample player_s4;
AudioSample player_s5;
AudioSample player_s6;
AudioSample player_s7;

AudioPlayer backing;

//TOUCH OSC  
import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress iPad; 

//sound vars
float sound1 = 0.0f;
float sound2 = 0.0f;
float sound3 = 0.0f;
float sound4 = 0.0f;
float sound5 = 0.0f;
float sound6 = 0.0f;
float sound7 = 0.0f;

//GRADIENT VARS
float colx = 0.0f;
float coly = 0.0f;

int int_colx, int_coly;

// GRADIENT CONSTANTS
int Y_AXIS = 1;
color c1, c2;

//ANIMATION VARS
Animation animation1, animation2, animation3, animation4;
float plantline_1 = 0.0f;
float plantshadow_1 = 0.0f;
float cigarette_line = 0.0f;
float cigarette_shadow = 0.0f;

//CLOCK VARS
float clock = 0.0f;

float sx=0;  //x-coord of point on second hand 
float sy=0;  //y-coord of point on second hand 
float sn=0; // second angle

float mx=0;  //x-coord of point on minute hand 
float my=0;  //y-cooridinate of point the minute hand 
float mn=0; // minute angle

float hx=0;  //x-coord of point on hour hand 
float hy=0;  //ycoord of point on hour hand 
float hn=0; // hour angle

//DARKNESS VAR
float darkness = 0.0f;

//LIGHT VAR
float light = 0.0f;
PImage light_img;

void setup() {

  
  fullScreen(); //projector size(1920,1200)
  //size(1440, 900); // mac_pro size
  //size(1000,800); //test size
  
  //ANIMATIONS
  frameRate(10);
  animation1 = new Animation("plantframe_line", 18);
  animation2 = new Animation("plantframe_shadow", 18);
  animation3 = new Animation("cigarette_line", 10);
  animation4 = new Animation("cigarette_shadow", 10);
 
  //SOUND
    minim = new Minim(this);
  
 
  player_s1 = minim.loadSample("1.wav", 512);
  player_s2 = minim.loadSample("2.wav", 512);
  player_s3 = minim.loadSample("3.wav", 512);
  player_s4 = minim.loadSample("4.wav", 512);
  player_s5 = minim.loadSample("5.wav", 512);
  player_s6 = minim.loadSample("6.wav", 512);
  player_s7 = minim.loadSample("7.wav", 512);
  
  backing = minim.loadFile("BACKING.wav");
  backing.loop();
  
  // OSC CONNECTION 
  oscP5 = new OscP5(this,8000); 
  iPad = new NetAddress("192.168.43.142",8000);

  // DEFINE COLOURS

  c1 = color(159,218,231); //  blue
  c2 = color(176,170, 227); // lilac

  
  // LIGHT IMAGE
  light_img = loadImage("light.png");

}


  
void draw() {  
   
  // GRADIENT REACTION
  
  int myR1 = (int) map(colx, 0, width, 176, 255);  //purple to yellow
  int myG1 = (int) map(colx, 0, width, 170, 209);
  int myB1 = (int) map(colx, 0, width, 227, 85);
  
  int myR2 = (int) map(coly, 0, width, 159, 24); //light blue to dark blue
  int myG2 = (int) map(coly, 0, width, 218, 5);
  int myB2 = (int) map(coly, 0, width, 231, 102);
  
  c1 = color(myR2, myG2, myB2); 
  c2 = color(myR1, myG1, myB1); // lilac
  setGradient(0, 0, width, height, c1, c2, Y_AXIS);
  
  
  // SOUNDS
  
  if(sound1 == 1.0){
  player_s1.trigger();
  
  }else if(sound2 == 1.0){
  player_s2.trigger();
  
  }else if(sound3 == 1.0){
  player_s3.trigger();
  
  }else if(sound4 == 1.0){
  player_s4.trigger();
  
  }else if(sound5 == 1.0){
  player_s5.trigger();
  
  }else if(sound6 == 1.0){
  player_s6.trigger();
  
  }else if(sound7 == 1.0){
  player_s7.trigger();
  }
  
  //ANIMATIONS
    if (plantline_1 == 1) {
    animation1.display();
  }else if (plantshadow_1 == 1){
    animation2.display();
  }else if (cigarette_line == 1){
    animation3.display();
  }else if (cigarette_shadow == 1){
    animation4.display();
  }
  
  //CLOCK
  if(clock == 1){
    sx=cos(sn)*width/2+width/2;  //x value of the second point of the second hand
  sy=sin(sn)*height/2+height/2;  //y value of the second point of the second hand

  mx=cos(mn)*width/2+width/2;
  my=sin(mn)*height/2+height/2;
  
  hx=cos(hn)*width/2+width/2;
  hy=sin(hn)*height/2+height/2;

  //increase the angle of the second hand 
  sn=second()*(2*PI/60);
  mn=minute()*(2*PI/60);
  hn=hour()*(2*PI/12);
  
  //CLOCK HANDS --> centre to sx,sy
  strokeWeight(1);
  strokeCap(ROUND);
  stroke(0);
  line(width/2,height/2,sx,sy);
  line(width/2,height/2,mx,my);
  line(width/2,height/2,hx,hy);
  }
 
  //DARKNESS
   if (darkness > 0) {
    noStroke();
    fill(0, darkness);
    rect(0,0, width, height);
   }
  
  //LIGHT
  if (light == 1) {
    image(light_img, 0, 0); 
  }
  
  }


void oscEvent(OscMessage theOscMessage){
  
  String addr = theOscMessage.addrPattern();
  float val = theOscMessage.get(0).floatValue();

//GRADIENT VARIABLES
  if(addr.equals("/y/x")){ 
    colx = val;
      }
   
     if(addr.equals("/y/y")){ 
    coly = val;
      }
  
  int int_colx = int(colx);
  int int_coly = int(coly);
  
  println(colx, coly, int_colx, int_coly);

 //SOUND VARIABLES
  if(addr.equals("/y/sound1")){ 
    sound1 = val;
      }
   
  if(addr.equals("/y/sound2")){ 
    sound2 = val;
      }
  
  if(addr.equals("/y/sound3")){ 
    sound3 = val;
      }
   
  if(addr.equals("/y/sound4")){ 
    sound4 = val;
      }
      
   if(addr.equals("/y/sound5")){ 
    sound5 = val;
      }
   
  if(addr.equals("/y/sound6")){ 
    sound6 = val;
      }
      
  if(addr.equals("/y/sound7")){ 
    sound7 = val;
      }
      
 // ANIMATION VARIABLES
 if(addr.equals("/y/plantline1")){ 
    plantline_1 = val;
      }
      
 if(addr.equals("/y/plantshadow1")){ 
    plantshadow_1 = val;
      }
      
 // CLOCK VARIABLE
 if(addr.equals("/y/clock")){
   clock = val;
 }
 
 //DARKNESS VARIABLE
 if(addr.equals("/y/darkness")){
   darkness = val;
 }
 
 //LAMP VARIABLE
 if(addr.equals("/y/light")){
   light = val;
 }
 
 //CIGARETTE VARIABLE
 if(addr.equals("/y/cigarette_line")){
   cigarette_line = val;  
 }
 if(addr.equals("/y/cigarette_shadow")){
   cigarette_shadow = val;  
 }
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

}

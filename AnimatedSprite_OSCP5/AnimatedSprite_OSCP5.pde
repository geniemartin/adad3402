/**
 * Animated Sprite (Shifty + Teddy)
 * by James Paterson. 
 * 
 * Press the mouse button to change animations.
 * Demonstrates loading, displaying, and animating GIF images.
 * It would be easy to write a program to display 
 * animated GIFs, but would not allow as much control over 
 * the display sequence and rate of display. 
 */

import netP5.*;
import oscP5.*;

OscP5 oscP5;

NetAddress iPad; 

Animation animation1, animation2;

float changeAni = 0.0f;

float xpos;
float ypos;
float drag = 30.0;

void setup() {
  size(640, 360);
  background(255, 204, 0);
  frameRate(24);
  animation1 = new Animation("PT_Shifty_", 38);
  animation2 = new Animation("PT_Teddy_", 60);
  ypos = height * 0.25;
  
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
  float dx = mouseX - xpos;
  xpos = xpos + dx/drag;

  // Display the sprite at the position xpos, ypos
  if (changeAni == 1) {
    background(153, 153, 0);
    animation1.display(xpos-animation1.getWidth()/2, ypos);
  } else {
    background(255, 204, 0);
    animation2.display(xpos-animation1.getWidth()/2, ypos);
  }
}

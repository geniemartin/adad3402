
import ddf.minim.*;

Minim minim;
AudioSample player_s1;
AudioSample player_s2;


void setup()
{
  size(512, 200, P3D);
  
  minim = new Minim(this);
  
 
  player_s1 = minim.loadSample("1.wav", 512);
  player_s2 = minim.loadSample("2.wav", 512);
  //player.play();
  
  //ambient_backing = minim.loadFile("BACKING.wav");
  //ambient_backing.loop();
}

void draw(){
  background(255);
  fill(255,0,0);
  rect(25,25,50,50);


  fill(0,0,255);
  rect(125,25,50,50);
}

void mousePressed(){
  
  if(mouseX > 25 && mouseX < 75 && mouseY > 25 && mouseY < 75){
  player_s1.trigger();
  
}else if(mouseX > 125 && mouseX < 175 && mouseY > 25 && mouseY < 75){
  player_s2.trigger();
}
}

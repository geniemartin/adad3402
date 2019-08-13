import processing.sound.*;

SoundFile backing;

SoundFile[] file;
int numsounds = 7;

void setup() {
  size(640, 360);
  backing = new SoundFile(this, "BACKING.wav");
  //BACKING TRACK VOL.
  backing.amp(0.3);
  //BACKING TRACK SPEED
  backing.rate(0.25);
  //REPEAT
  backing.loop();
  
  
  file = new SoundFile[numsounds]; 
  
  for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, (i+1) + ".wav");
  }
  
//  sound1 = new SoundFile(this, "sound1.wav");
//  sound2 = new SoundFile(this, "sound2.wav");
//  sound3 = new SoundFile(this, "sound3.wav");
//  sound4 = new SoundFile(this, "sound4.wav");
//  sound5 = new SoundFile(this, "sound5.wav");
//  sound6 = new SoundFile(this, "sound6.wav");
//  sound7 = new SoundFile(this, "sound7.wav");
}

void draw() {
  background(255);
  
}

boolean playing = true;


void keyPressed(){
  boolean validKey = true;

  switch(key) {
  case '1':
    file[0].play(0.5, 1.0);
    break;

  case '2':
    file[1].play(0.5, 1.0);
    break;

  case '3':
    file[2].play(0.5, 1.0);
    break;

  case '4':
    file[3].play(0.5, 1.0);
    break;

  case '5':
    file[4].play(0.5, 1.0);
    break;

  case '6':
    file[5].play(1.0, 1.0);
    break;

  case '7':
    file[6].play(1.0, 1.0);
    break;
    
   default:
    validKey = false;
  }
}

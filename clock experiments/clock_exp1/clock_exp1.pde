//CLOCK VARS

float sx=0;  //x-coord of point on second hand 
float sy=0;  //y-coord of point on second hand 
float sn=0; // second angle

float mx=0;  //x-coord of point on minute hand 
float my=0;  //y-cooridinate of point the minute hand 
float mn=0; // minute angle

float hx=0;  //x-coord of point on hour hand 
float hy=0;  //ycoord of point on hour hand 
float hn=0; // hour angle


void setup(){
  size(1400,900);
  
}

void draw(){
  background(255);
  
  
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
  line(width/2,height/2,sx,sy);
  line(width/2,height/2,mx,my);
  line(width/2,height/2,hx,hy);
  

}

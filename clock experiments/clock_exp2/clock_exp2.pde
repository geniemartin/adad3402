float t;
float myX;
float myY;

void setup(){
  size(600,600);
  noStroke();
  background(242);
}


void draw(){
  fill(242,23);
  noStroke();
  rect(0,0,600,600);
  
  t = t+0.02;
  
  translate(300,300);
  for(float i=0;i<4;i++){
  float angle=0;

    
    
  angle=map(i,0,6,0,10);
  fill(80,0,70);
    noStroke();
  ellipse(sin(angle+t)*80*i,cos(angle+t)*80*i,40,40);
  fill(242);
  ellipse(0,0,40,40);
     
  fill(200,0,70);
  noStroke();
  ellipse(sin(angle+t)*80*(i+0.5),-cos(angle+t)*80*(i+0.5),40,40);

  
}
}

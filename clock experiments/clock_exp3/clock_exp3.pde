float angle;

void setup() {
  size(900, 1400);
  smooth();

}

void draw() {
  background(0, 35, 45);

  
  angle+=0.005;

  translate(width/2, height/3);
  rotate(-HALF_PI);
  
  fill(0, 35, 45);
  stroke(255);
  strokeWeight(20);
  strokeCap(ROUND);
  
  pushMatrix();
  rotate(angle);
  arc(0, 0, 500, 500, 0, radians(second()*6));
  rotate(radians(second()*6));
  popMatrix();
  
  pushMatrix();
  rotate(2*angle);
  arc(0, 0, 450, 450, 0, radians(minute()*6));
  rotate(radians(minute()*6));
  popMatrix();
  
  pushMatrix();
  rotate(-angle);
  arc(0, 0, 400, 400, 0, radians(hour()*15));
  rotate(radians(hour()*15));
  popMatrix();
}

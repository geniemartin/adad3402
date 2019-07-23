static final int NUM = 0300, NEWEST = NUM - 1;
final int[] x = new int[NUM], y = new int[NUM];
 
void setup() {
  size(800, 600, JAVA2D);
   
  colorMode(RGB, NEWEST);
  frameRate(60);
  smooth(4);
  strokeWeight(1);
 
  mouseX = width>>1;
  mouseY = height>>1;
 
  for (int i = NUM; i-- != 0; x[i] = mouseX, y[i] = mouseY);
}
 
void draw() {
  background(203,157,255);
 
  for (int i = 0; i != NEWEST;) {
    stroke(255, i, 101);
    line(x[i], y[i], x[i] = x[i + 1], y[i] = y[++i]);
    
    //noStroke();
    //fill(255, i, 101);
    //ellipse(x[i], y[i], x[i] = x[i + 1], y[i] = y[++i]);
  }
 
  x[NEWEST] = mouseX;
  y[NEWEST] = mouseY;
}

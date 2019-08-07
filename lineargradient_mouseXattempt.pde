// Constants
int Y_AXIS = 1;
color c1, c2;

//int r,g,b;

void setup() {
  size(640, 360);

  // Define colors

  c1 = color(159,218,231); //  blue
  c2 = color(176,170, 227); // lilac
  //c2 = color(r,g,b); // lilac --> yellow

  noLoop();
}

void draw() {
  // Background
  setGradient(0, 0, width, height, c1, c2, Y_AXIS);
  
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
  

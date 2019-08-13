int Y_AXIS = 1;
color c1, c2;


int maxImages = 17; // Total # of images
int imageIndex = 0; // Initial image to be displayed is the first

// Declaring an array of images.
PImage[] images = new PImage[maxImages];

void setup() {
  size(1440, 900);
  
  c1 = color(159,218,231); //  blue
  c2 = color(176,170, 227); // lilac

  // Loading the images into the array
  // Don't forget to put the JPG files in the data folder!
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "plantframe_line" + i + ".png" );
  }
  frameRate(15);
}

void draw() {

  background(255);
  
  int myR1 = (int) map(mouseX, 0, width, 176, 255);  
  int myG1 = (int) map(mouseX, 0, width, 170, 209);
  int myB1 = (int) map(mouseX, 0, width, 227, 85);
  
  int myR2 = (int) map(mouseY, 0, width, 159, 24);  
  int myG2 = (int) map(mouseY, 0, width, 218, 5);
  int myB2 = (int) map(mouseY, 0, width, 231, 125);
  
  c1 = color(myR2, myG2, myB2); 
  c2 = color(myR1,myG1,myB1); // lilac
  setGradient(0, 0, width, height, c1, c2, Y_AXIS);
  
  image(images[imageIndex], 0, 0);

  // increment image index by one each cycle
  // use modulo " % "to return to 0 once the end of the array is reached
  imageIndex = (imageIndex + 1) % images.length;
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

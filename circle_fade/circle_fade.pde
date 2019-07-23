void setup() {
  size(1000, 600);
  background(203,157,255);

}

void draw() {
  noStroke();
  fill(0,144,102);
  ellipse(mouseX, mouseY, 50, 50);
  filter(BLUR, 0.58);
}

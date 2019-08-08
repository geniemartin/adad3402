void setup() {
  size(1000, 600);
  background(159,218,231);

}

void draw() {
  //background(159,218,231);
  noStroke();
  fill(176,170,231, 50);
  //rect(a=x-coord, y-coord, width, height)
   rect(0, 500, 1000, 100);
   filter(BLUR, 0.58);
}

//TEST NEW COLOURS, mouse pressed activates tiny rect sliver, then add to touchOSC

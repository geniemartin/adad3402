color bg, c1, c2;
PGraphics gradientBG;  //gradient
float amp,pos,ang = 0,null_one = 0,zoom =30;

void setup() {
  size(200, 200);
  stroke(0, 0, 200);
  gradientBG = createGraphics(width, height);
  c1 = color(204, 102, 0);
  c2 = color(0, 102, 153);
  transfer_function();                             // init
}

void draw() {
  background(gradientBG);
  transfer_function();                             // calc null_one cosinus transient and draw graph and bg image
}

void transfer_function() {  
  gradientBG.beginDraw();
  gradientBG.noFill();
  for (int x = 0; x< width; x++ ) {
    amp = map(mouseY,0,height,0.01,1);
    pos = map(mouseX+x*amp,0,width,0,1);
    ang = PI*pos;
    constrain(ang,0,PI);
    null_one = ( 1+ cos(ang) )/2;
    line( x, height/2, x, height/2-zoom*null_one);
    bg = lerpColor(c1, c2, null_one );
    gradientBG.stroke(bg);
    gradientBG.line(x,0, x, height);
  }
  gradientBG.endDraw();
}

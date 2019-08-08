
PImage img = createImage(100, 100, RGB);
PGraphics pg = createGraphics(100,100, JAVA2D);

size(500, 500);

 
//create your gradient in a PImage
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++)
{
  img.pixels[i] = color(0, 90, i % img.height* 2);
}
img.updatePixels();
 
//create your mask in a PGraphics
pg.beginDraw();
pg.background(0);
pg.smooth();
pg.noStroke();
pg.fill(255);
pg.rect(0, 0, 200, 200); //unreferenced rounded rect; use 30, 30 in 1.5.1
pg.endDraw();
 
img.mask(pg); // apply your mask
 
background(#BBBB88);
image(img, 0, 0);

void setup() {
  size(800, 800);
  PImage img = loadImage("dream.jpg");
  int detail = 4;
 
  for (int i=0; i<width; i+=detail) {
    for (int j=0; j<height; j+=detail) {
      PImage newImg = img.get(i, j, detail, detail);
      fill(extractColorFromImage(newImg));
      rect(i, j, detail, detail);
      
    }
  }
}
 
color extractColorFromImage(PImage img) {
  img.loadPixels();
  int r = 0, g = 0, b = 0;
  for (int i=0; i<img.pixels.length; i++) {
    color c = img.pixels[i];
    //r += c>>16&0xFF;
    g += c>>8&0xFF;
   b += c&0xFF;
  }
  r /= img.pixels.length;
  g /= img.pixels.length;
  b /= img.pixels.length;
 
  return color(r, g, b);
}

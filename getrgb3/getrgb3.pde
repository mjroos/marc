void setup() {
  size(800, 800);
  PImage img = loadImage("kwadratuur.jpg");
  int detail = 15;
 
  for (int i=0; i<width; i+=detail) {
    for (int j=0; j<height; j+=detail) {
      PImage newImg = img.get(i, j, detail, detail);
      fill(extractColorFromImage(newImg));
      
      rect(i, j, detail, detail);
      
    }
  }
}
 

color extractColorFromImage(final PImage img) {
  img.loadPixels();
  color r = 0, g = 0, b = 0;
 
  for (final color c : img.pixels) {
    r += c >> 020 & 0xFF;
    g += c >> 010 & 0xFF;
    b += c        & 0xFF;
  }
 
  r /= img.pixels.length;
  g /= img.pixels.length;
  b /= img.pixels.length;
 
  return color(r, g, b);
}

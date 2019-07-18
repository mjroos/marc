void setup() {
  size(800, 800);
  PImage img = loadImage("v6.jpg");
  int detail = 3;
 
  for (int i=0; i<width; i+=detail) {
    for (int j=0; j<height; j+=detail) {
      PImage newImg = img.get(i, j, detail, detail);
      fill(extractColorFromImage(newImg));
      
        rect(i, j, detail, detail);
      
    }
  }
   save("vp.jpg");
}
 
//color extractColorFromImage(PImage img) {
//  img.loadPixels();
//  int r = 0, g = 0, b = 0;
//  for (int i=0; i<img.pixels.length; i++) {
//    color c = img.pixels[i];
//    //r += c>>16&0xFF;
//    g += c>>8&0xFF;
//   b += c&0xFF;
//  }
//  r /= img.pixels.length;
//  g /= img.pixels.length;
//  b /= img.pixels.length;
 
//  return color(r, g, b);
//}

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
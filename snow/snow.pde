

void setup() {
  size(600, 600);
}




void draw() {
  loadPixels();

  for (int x =0; x < width; x++) {
    for (int y = 0; y < height; y++) {

      int index = int(x)+ int(y)*width;

      float c = random(255);

      pixels[index]=color(c);
    }
  }

  updatePixels();
}

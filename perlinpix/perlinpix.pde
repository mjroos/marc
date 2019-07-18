float xoff=0;
float yoff=0;

void setup() {
  size(600, 600);
}




void draw() {
  loadPixels();

  for (int x =0; x < width; x++) {
    xoff+=0.01;
    for (int y = 0; y < height; y++) {

      int index = int(x)+ int(y)*width;

      float c =map(noise(xoff,yoff),0,1,0,255); //random(255);

      pixels[index]=color(c);
      
      yoff=0.01;
    }
  }

  updatePixels();
}

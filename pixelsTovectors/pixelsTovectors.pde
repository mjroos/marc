PImage img;
ArrayList<PVector> vec;
PVector p, nul, k, v, w;

void setup() {
  size(640, 600, P3D);
  vec = new ArrayList<PVector>();
  img=loadImage("Wasp.jpg");
  image(img, 70, 50);
}

void draw() {
  background(0);
  smooth();

  fill(255);
  textSize(20);
  text("Pixels to Vectors", 20, 30);
  noFill();

  translate(width/2, height/2);

  delay(3000);

  for (int x =0; x < img.width; x++) {
    for (int y =0; y<img.height; y++) {
      if (img.get(x, y)>=color(0) && img.get(x, y)<=color(130) ) {

        p = new PVector(x, y, 0);
        nul = new PVector(40, 30, 0);

        k = PVector.sub(p, nul);
        k.mult(1.5);


        stroke(255, 255, 0);
        point(k.x-(width/2), k.y-(height/2));
      }
      if (img.get(x, y)>=color(130) && img.get(x, y)<=color(230) ) {

        v = new PVector(x, y, 0);
        nul = new PVector(40, 30, 0);

        w = PVector.sub(v, nul);
        w.mult(1.5);

        stroke(255, 0, 0);
        point(w.x-(width/2), w.y-(height/2));
      }
    }
  }
  noLoop();
}

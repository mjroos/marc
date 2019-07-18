int cols, rows;
int scl = 10;
int w =300;
int h = 300;
float[][] terrain;
float inc;
PImage img;
PImage img2;

void setup() {
  size(1200, 600, P3D);
  img=loadImage("vlag3.jpg");
  img2=loadImage("602.jpg");
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
}


void draw() {
  background(img2);
  frameRate(50);
  stroke(0);
  //textSize(20);
  //text("by Repel", 1100,20);

  textSize(40);
  text("Verenigde Oost Indische Compagnie", 300,100);

  inc-=.05;
  noiseDetail(3);
  float yoff = inc;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x =0; x < cols; x++) {
      terrain[x][y]=map(noise(xoff, yoff), 0, 1, -100, 180);
      xoff+=0.03;
    }
    yoff+=.03;
  }

  //stroke(0,255,255,50);
  //noFill();
  noStroke();


  translate(165, 200);
  rotateY(.25*PI);
  rotateX(.35*PI);
  translate(-w/2, -h/2);

  //directionalLight(203, 132, 38, 0, 1, -1);
  //ambientLight(12, 85, 16, 600, 600, 100);
  directionalLight(255, 255, 338, 0, 1, -1);
  //ambientLight(12, 85, 16, 600, 600, 100);
  //fill(0, 255, 255);

  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);
    textureMode(IMAGE);
    texture(img);
    for (int x =0; x < cols; x++) {

      vertex(x * scl, y * scl, terrain[x][y], x * scl, y * scl);
      vertex(x * scl, (y+1) * scl, terrain[x][y+1], x * scl, (y+1) * scl);
    }
    endShape();
  }
}

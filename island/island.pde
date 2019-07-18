int col, row;
int scl=10;
int w=1200;
int h =1000;
float[][] z;
float a =0;
PImage img;
PImage wood;
PShape box1;
void setup() {

  size(600, 600, P3D);
  img=loadImage("island2.png");
  wood = loadImage("wood2.jpg");
  noiseDetail(2);
  col= w/scl;
  row = h/scl;
  z = new float[col][row];
  // image(img,0,0);
}

void draw() {
  background(img);

  noiseDetail(2);
  //lights();
  pushMatrix();
  noStroke();
  stroke(0, 255, 255, 30);
  //noFill(0);
  translate(width/2, 500);
  //directionalLight(40, 155, 255, -1, -1, -1);
  //ambientLight(40, 121, 232, -1, -1, -1);
  directionalLight(102, 102, 102, 1, 0, -1);
  //lightSpecular(204, 204, 204);
  directionalLight(102, 102, 102, 0, 1, -1);
  lightSpecular(102, 102, 102);

  float yoff=a;
  for (int y =0; y < row; y++) {
    float xoff=0;
    for (int x =0; x < col; x++) {
      z[x][y]=map(noise(xoff, yoff), 0, 1, -50, 50);


      xoff+=0.02;
    }
    yoff+=.07;
  }
  a+=.02;//sin(.11);



  pushMatrix();
  rotateX(PI/2);
  translate(-w/2, -h/2);

  for (int y =0; y < row-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x =0; x < col-1; x++) {
      //fill(25, 255, 255);
      //noFill();

      vertex(x*scl, y*scl, z[x][y]);
      vertex(x*scl, (y+1)*scl, z[x][y+1]);
    }

    endShape();
  }
  popMatrix();
  fill(255);
  strokeWeight(4);
  //noFill();
  noStroke();
  translate(0, 12, -100);

  beginShape();


  rotateY(a/2);
  rotateX(a/2);



  box(15*15, 400, 8*15);
  texture(wood);
  strokeWeight(1);
  endShape();

  popMatrix();
}

PShape planet1; 
PImage img; 

float R = 200;
float s =0;

float u;
float us = .001;
float direction=1;

void setup() {
  size(500, 500, P3D);
  img = loadImage("data/world32k.jpg");
  u=0;
}


void draw() {
  background(0);



  translate(width/2, height/2);


  u=u+(us*direction);
  textMode(SHAPE);
  textSize(12);

  float x0=0;
  float y0=-200;

  float x1=0;
  float y1=200;

  float px=175*cos(.41-HALF_PI);
  float py=175*sin(.41-HALF_PI);

  float qx=175*cos(.32-HALF_PI);
  float qy=175*sin(.32-HALF_PI);

  rotateZ(0);
  fill(255, 255, 255);
  stroke(0);
  //text("Noordpool", x0+10, y0);
  //text("Zuidpool", x1+10, y1);
  fill(255, 255, 255);
  text("24.5", px+10, py);
  text("22.5", qx-20, qy+20);
  noFill();

  //lights();
  directionalLight(255, 255, 255, -100, 0, 0);
//spotLight(255, 255, 255, 200, 0, 200, -100, -50, -50, -1, 1);

  strokeWeight(5);
  stroke(255, 0, 0);
  point(0, -175);
  point(px, py);
  point(qx, qy);
  stroke(0);

  strokeWeight(1);
  noFill();

  stroke(255, 0, 0);
  arc(0, 0, 350, 350, -1-QUARTER_PI, 1-(1.2*HALF_PI));
  stroke(0);

  stroke(255, 255, 255);
  line(x0, y0, x1, y1);


  rotateZ(u);
  fill(255, 255, 255);

  text("Noordpool", x0+10, y0);
  text("Zuidpool", x1+10, y1);


  strokeWeight(3);
  line(x0, y0, x1, y1);
  stroke(255, 255, 255);
  strokeWeight(10);
  point(x0, y0);
  point(x1, y1);
  strokeWeight(1);

  planet();
  //stroke(255,0,0);
  //sphere(102);
  s+=.02;

  if (u>=0.41 || u<=0) {

    direction*=-1;
  }
}


void planet() {
  noFill();
  noStroke();
  sphereDetail(34);
  planet1 = createShape(SPHERE, 100);

  planet1.setTexture(img);

  rotateY(s);


  shape(planet1);
  stroke(0);
}
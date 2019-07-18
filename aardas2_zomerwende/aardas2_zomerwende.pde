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
  u=.32;
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
  //noFill();

  lights();
  directionalLight(255, 255, 255, -100, 0, 0);
  spotLight(255, 255, 255, 200, 0, 200, -100, -50, -50, -1, 1);

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

  //noFill();
  ellipse(0, 0, 200, 200);
  stroke(255, 0, 0);

  pushMatrix();
  rotateZ(-u);
  zomerwende();
  ecliptica();
  popMatrix();

  evenaar();
  kreeftskeerkring();
  steenbokskeerkring();
  poolcirkel();

  //planet();
  //stroke(255,0,0);
  //sphere(102);
  s+=.02;

  if (u>=0.41 || u<=0.32) {

    direction*=-1;
  }
}

void ecliptica() {
  stroke(255,0,0);
  line(-250, 0, 250, 0); //evenaar
  fill(255, 0, 0);
  textSize(15);
  text("Ecliptica", -225, -5);
  textSize(12);
  text("Zon 90 \260", 125, 0);
  }

void evenaar() {
  line(-100, 0, 100, 0); //evenaar
  fill(255, 0, 0);
  text("Evenaar", -20, -5);
  }

void steenbokskeerkring() {
  float sx1=100*cos(0.41);
  float sy1 =100*sin(0.41);
  float sx2=100*cos(-.41+PI);
  float sy2 =100*sin(-.41+PI);
  //point(sx1,sy1);
  //point(sx2,sy2);
  line(sx1, sy1, sx2, sy2);
  fill(255, 0, 0);
  text("Steenbokskeerkring, ZB 23,5", sx1-175, sy1+10);
 }

void kreeftskeerkring() {
  float kx1=100*cos(3.55);
  float ky1 =100*sin(3.55);
  float kx2=100*cos(-3.55+PI);
  float ky2 =100*sin(-3.551+PI);
  //point(sx1,sy1);
  //point(sx2,sy2);
  line(kx1, ky1, kx2, ky2);
  fill(255, 0, 0);
  text("Kreeftskeerkring, NB 23,5", kx2-170, ky2-5);
  
  
 }
 
 void poolcirkel() {
  float px0=100*cos(1.16);
  float py0 =100*sin(1.16);
  float px1=100*cos(-1.16+PI);
  float py1 =100*sin(-1.16+PI);
  point(px0,py0);
  point(px1,py1);
  line(px0, py0, px1, py1);
  fill(255, 0, 0);
  text("Poolcirkel", px1+10, py1-5);
  
  float px2=100*cos(-1.16);
  float py2 =100*sin(-1.16);
  float px3=100*cos(1.16+PI);
  float py3 =100*sin(1.16+PI);
  point(px2,py2);
  point(px3,py3);
  line(px2, py2, px3, py3);
  fill(255, 0, 0);
  text("Poolcirkel", px3+10, py3+10);
 }

void zomerwende() {
  //zomerwende
  stroke(250, 250, 0);
  fill(250, 250, 0);
  rect(0, -100, 250, 200);
    noStroke();
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
//* @pjs preload="universe.jpg,world32k.jpg,moon.jpg"; */

PImage bg;
PImage img;
PImage img2;
PShape sh;
PShape planet1;
PShape moon;

float x=0;
float y=0;
float h=0;
float boxsize=120;
float moonsize=20;
boolean rond=true;
float s=1;
float t=1;
float baan=300;
Boolean orbit;
Boolean plattegrond;
Hemelbaan aardBaan;

void setup() {

  size(600, 600, P3D); 

  noStroke();
  smooth();
lights();
bg = loadImage("universe.jpg");
  img = loadImage("world32k.jpg");
  img2 = loadImage("moon.jpg");
  //sh = createShape(ELLIPSE, 0, 0, boxsize, boxsize);
 
 

  planet1 = createShape(SPHERE, boxsize);
  planet1.setTexture(img);
  
  moon = createShape(SPHERE, moonsize);
  moon.setTexture(img2);
  
  //aardBaan = new Hemelbaan(0,0,152,147,2.5);
}

void draw() {
  background(bg);
  
  fill(255, 255, 255);
  textSize(10);
  text("Made by Marc Roos", 30,30);
  text("16 jan. 2016", 30,40);
  text("Constellation of the Earh and the Moon", 30,60);
  noFill();
  pushMatrix();
   rotateY(1);
  translate(width/2, height/2);
  spotLight(255, 255,255,-700, 0,400, 200, 400, 400, 0, 0);
  stroke(255);
  //ellipse(0, 0, baan, baan);
 
  noStroke();
  println(mouseX-(width/2), x);

  if (mouseX-width/2>=x-boxsize && mouseX-width/2 <= x+boxsize
    && mouseY-height/2>=y-boxsize && mouseY-height/2<=y+boxsize) {
    rond=true;
    
    if (rond==true) {

     //translate(mouseX-width/2, mouseY-height/2); //tbv sphere

      scale(s);
      shape(planet1);

      noFill();
    }
  } else {
    rond=false;

    s=1;

    //translate(x, y); //tbv sphere

    rotateY(PI * frameCount / 500);

    shape(planet1);
//aardBaan.display();
    orbit();
    noFill();
    pushMatrix();
     translate(500, 0,0); //tbv sphere
     rotateY(0.8*PI);
    rotateY(PI * frameCount / 5000);
    shape(moon);
    popMatrix();
  }

  if (keyPressed) {
    if (key=='1') {
      rond=false;
      boxsize=6;

      translate(x, y);
      shape(planet1);

      orbit();
      noFill();
    }
  }
   
  popMatrix();
  rect(0, 0, width, height);
}


void orbit() {
  x = baan/2 * sin(h);
  y = baan/2 * cos(h);
  h=h+0.01;
}


void mousePressed() {
  if (rond==true) {
    s=s+1;
  } else {
    s=1;
  }
}
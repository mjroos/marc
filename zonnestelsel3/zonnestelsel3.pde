
Hemelbaan zonBaan;
Hemelbaan mercuriusBaan;
Hemelbaan venusBaan;
Hemelbaan aardBaan;
Hemelbaan marsBaan;
Hemelbaan jupiterBaan;
Hemelbaan saturnusBaan;
Hemelbaan uranusBaan;
Hemelbaan neptunusBaan;
Hemelbaan plutoBaan;
//Planeet zon;

PImage bg;
Boolean orbit;
Boolean plattegrond;

float a = 0.045;
float b = 0.0;
float s = 0.0;

void setup() {
  size(800, 800, P3D);
  bg = loadImage("heelal1.jpg");
  orbit=false;
  plattegrond=false;
  frameRate(150);


  zonBaan = new Hemelbaan(0, 0, 0, 0, 0);
  mercuriusBaan = new Hemelbaan(0, 0, 58, 58, 0); //x,y,aphelium,perihelium,brandpunt
  venusBaan = new Hemelbaan(0, 0, 108, 108, 0);
  aardBaan = new Hemelbaan(0, 0, 152, 147, 2.5);
  marsBaan = new Hemelbaan(0, 0, 250, 208, 22);
  jupiterBaan = new Hemelbaan(0, 0, 815, 740, 37.5);
  saturnusBaan = new Hemelbaan(0, 0, 1505, 1347, 79);
  uranusBaan = new Hemelbaan(0, 0, 3000, 2734, 133);
  neptunusBaan = new Hemelbaan(0, 0, 4531, 4454, 38.5);
  plutoBaan = new Hemelbaan(0, 0, 7370, 4440, 1465);
}

void draw() {
  background(bg);
  noLights();



  // a = a + 0.0001;
  //s = cos(a)*2;
  s =a;
  b +=.01;
  if (b > 0.35*PI) { 
    b = 0.35*PI;
  }

  pushMatrix();
  translate(width/2-50, height/2);

  if (keyPressed) {
    if (key=='3') {
      plattegrond=true;
      } else if (key == '4') {
      plattegrond = false;
    }
  }

  if (plattegrond) {
    stroke(255);
    strokeWeight(1);
    background(0);
    lights();
    ambientLight(255,255,255);
    b=0;
  } 


  scale(a);
  
  pushMatrix();
  translate(0, 0, 0);

  noStroke();
  fill(252, 228, 87);
  sphere(50);
  noFill();

  popMatrix();
  //lights();

  rotateX(b);

  pointLight(255, 255, 255, 0, 0, 0);



  //zonBaan.display();
  mercuriusBaan.display();
  venusBaan.display();
  aardBaan.display();
  marsBaan.display();
  jupiterBaan.display();
  saturnusBaan.display();
  uranusBaan.display();
  neptunusBaan.display();
  plutoBaan.display();

  popMatrix();

  //println(a);
}


void mouseWheel(MouseEvent event) {
  float e = event.getCount();

  a=a+(e/100);
  if (a<=0) {
    a=0.045;
  }
}
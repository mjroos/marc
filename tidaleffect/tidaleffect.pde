//Tidal Effect
// key 'r' is gravitation moon
//key 'b' is centripetal force earth
//key 't'is tidal power
//by Marc Roos
//07 feb 2020


PFont f1, f2, f3;
Aarde aarde;
Maan maan;
float c = 0;

void setup() {
  size(900, 900);
  f1 = createFont("arial",20);
  f2 = createFont("arial",30);
  f3 = createFont("arial",50);
  aarde = new Aarde();
  maan = new Maan();
}

void draw() {
  background(255);
  fill(0);
  textAlign(LEFT);
  textFont(f3);
  text("Tidal effect", 50,50);
  
  textFont(f1);
  text("Red arrow: Gravitation of the Moon", 50, 80);
  text("Black arrow: centripetal force of the Earth", 50, 110);
  text("Blue arrow: Tidal power", 50, 140);
  

  translate(width/2,height/2);
  strokeWeight(1);
  stroke(53,70);
  line(-100,0,100,0);
  line(0,-100,0,100);
  noStroke();
  
  scale(0.7);
  //aarde.show();
  //aarde.points();
  
  aarde.barycenter(aarde.r, maan.r, maan.d);
  aarde.trans(maan.moon);

  maan.update();
  maan.show();
  //maan.points();
  
   saveFrame("output/tidal-####.jpg");
}

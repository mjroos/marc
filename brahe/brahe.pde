float schaal =1.5;
float R = schaal * 50;
float Z=schaal * 12;
float M= schaal *10;
float Mr=schaal * 20;
float V= schaal *30;
float Mrs=schaal *80;
float J=schaal *120;
float S=schaal *150;
float dA = 36/schaal; //straal 6371 km
float dM = 10/schaal; // straal 1738 km
float dMr = 14/schaal; // straal 2440 km
float dV = 35/schaal; //straal 6052 km
float dZ = 500; //straal 695700 km
float dMrs = 19/schaal;// straal 3390 km
float dJ = 40.0; //straal 69911
float dS = 33.3; //straal 58232
float xR;
float yR;
float xZ;
float yZ;
float xM;
float yM;
//float xMr;
//float yMr;
//float xV;
//float yV;
//float xMrs;
//float yMrs;
//float xJ;
//float yJ;
//float xS;
//float yS;

float t = 0;

void setup() {
  size(800, 800);
}




void draw() {
  background(255);
  textSize(20);
  noFill();
  translate(width/2, height/2);

  //aarde
  strokeWeight(8);
  //point(0,0);    //aarde en middelpunt omloopbaan van de zon
  strokeWeight(1);
  fill(0, 0, 255);
  ellipse(0, 0, dA, dA); //aarde
  fill(0);
  text("aarde", 0, 0);
  noFill();

  // Zon
  //binnenPlaneet(color(255,0,0),Z,dZ,1,"Sun");
  xR=R*cos(t);
  yR=R*sin(t);
  xZ=R*cos(t)+cos(t);
  yZ=R*sin(t)+sin(t);
  ellipse(0, 0, 2*R, 2*R); //omloopbaan zon
  fill(255, 255, 102, 250);
  ellipse(xZ, yZ, 2*Z, 2*Z); //zon
  noFill();
  fill(0);
  text("zon", xR, yR);
  noFill();
  strokeWeight(8);
  //point(xZ,yZ);    //zon
  strokeWeight(1);

  //maanomloop aarde
  ellipse(0, 0, 2*M, 2*M); //omloopbaan aarde
  xM=M*cos(6*t);
  yM=M*sin(6*t);
  fill(0);
  ellipse(xM, yM, dM, dM);
  strokeWeight(8);
  //point(xM,yM);    //maan
  text("maan", xM, yM);
  noFill();
  strokeWeight(1);

  planeet(color(242,158,46),Mr, dMr, 5, "mercurius");
  
  planeet(color(255,255,255),V, dV, 4, "venus");
  
  planeet(color(250,30,38),Mrs, dMrs, 3, "mars");
  
  planeet(color(183,12,18),J, dJ, 2, "jupiter"); //jupiter
  
  planeet(color(250,30,38),S, dS, 1, "saturnus"); //saturnus

  t+=.003;
}

void binnenPlaneet(color kleur, float diam, float diam2, float v, String naam) {
  float xpos=diam*cos(t);
  float ypos=diam*sin(t);
  noFill();
  ellipse(0, 0, 2*diam, 2*diam); //omloopbaan maan mars


  fill(kleur);
  ellipse(xpos, ypos, diam2, diam2); //planeet 
  noFill();

  strokeWeight(8);
  fill(0);
  text(naam, xpos, ypos);
  //point(xpos,ypos);
  strokeWeight(1);
  
}

void planeet(color kleur, float diam, float diam2, float v, String naam) {
  float xpos=R*cos(t)+diam*cos(v*t) + cos(t);
  float ypos=R*sin(t)+diam*sin(v*t) + sin(t);
  noFill();
  ellipse(xZ, yZ, 2*diam, 2*diam); //omloopbaan maan mars


  fill(kleur);
  ellipse(xpos, ypos, diam2, diam2); //planeet 
  noFill();

  strokeWeight(8);
  fill(0);
  text(naam, xpos, ypos);
  //point(xpos,ypos);
  strokeWeight(1);
}
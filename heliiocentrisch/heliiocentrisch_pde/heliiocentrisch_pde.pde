/* mars
 diameter = 6794 km (0,045 ae)
 periode = 686,98 dagen
 afstand tot zon 1,52 Ae
 kleinste afstand tot de zon 1,3813 ae
 grootste afstand tot de zon 1,6659 ae
 
 aarde
 diameter = 12756 km (0.08504
 kleinste afstand = 0,98 ae
 grootste afstand = 1,02 ae
 halve lange as a = 1 ae
 excentriciteit 0,0167
 */

// array coordinaten schijnbare planeet
float[] m; //declare x
float[] n; //declare y;

//paramaters aarde
float brandpuntaarde;

float t=0;
float r1 =200; //straal aarde

float r2= 290; // straal hulpcirkel of epicycle 290 met deferent aarde
//float r2= 200; // straal hulpcirkel of epicycle 290 met deferent aarde
float r3=10;
float x0;
float y0;
float x1;
float y1;

float x0m; //x-coordinaat deferent mars
float y0m; //y-coordinaat deferent mars
float x0m1; //x-coordinaat parametrische vergelijking hulpcirkel of epicycle rakend aan deferent mars
float y0m1; //x-coordinaat parametrische vergelijking hulpcirkel of epicycle rakend aan deferent mars

float x5a; //positie planeet aarde
float y5a; //positie planeet aarde

float xa; //hemelbaan aarde
float ya; //hemelbaan aarde
float aa = 1.02; //grootste afstand aarde
float ba =0.98; //kleinste afstand aarde
float ca; //excentriciteit aarde
float fa; //brandpunt aarde


float x5m; //posite planeet mars
float y5m; //positie planeet mars

float xm; //hemelbaan mars
float ym; //hemelbaam mars
float am = 1.6659; //grootste afstand mars
float bm = 1.3813; //kleinste afstand marc
float cm; //excentriciteit mars
float fm; //brandpunt mars
float brandpuntmars;
float s; //match brandpuntsafstanden aarde en mars

int i;

PImage bg;




void setup() {    
  size(800, 800, P3D);
  //size(800, 800);

  ca= ((aa+ba)/2)-ba; //excentriciteit aarde
  brandpuntaarde = ca * aa; //brandpuntsafstand aarde
  fa = map(brandpuntaarde, 0, 5, 0, width); //gemapte brandpunts-coordinaat aarde; brandpunt aangepast aan pixels van het computerscherm



  xa = map(aa*2, 0, 5, 0, width); //gemapte x-coordinaat aarde; grootte aangepast aan pixels computerscherm
  ya = map(ba*2, 0, 5, 0, height);//gemapte y-coordinaat aarde; grootte aangepast aan pixels computerscherm

  cm= ((am+bm)/2)-bm; //excentriciteit van de baan van planeet mars
  brandpuntmars = cm *am; //brandpunt van de baan van planeet mars
  fm = map(brandpuntmars, 0, 5, 0, width); //gemapte brandpuntsafstand hemelbaan mars; aangepast aan pixels computerscherm

  s = fm-fa; //match brandpuntsafstanden aarde en mars

  xm =  map(am*2, 0, 5, 0, width); //gemapte grootste afstand henelbaan van mars; aanpassing pixels aan afmetingen computerscherm
  ym =  map(bm*2, 0, 5, 0, height);// gemapte kleinste afstand hemelbaan van mars; aampassing pixels aan afmetingen computerscherm

  m = new float[width]; //create x; coordinaat schijnbare baan mars
  n = new float[width]; //create y; coordinaat schijnbare planeet mars

  for (i=0; i<width; i++) {

    m[i]=xa/2*cos(i)+(r2/2)*cos(.5*i); //asign x; parametrische vergelijking schijnbare baan planeet mars met deferent aarde
    n[i]=xa/2*sin(i)+(r2/2)*sin(.5*i); //asign y;  parametrische vergelijking schijnbare baan planeet mars met deferent aarde

    //m[i]=xm/2*cos(i)+(r2/2)*cos(.5*i); //asign x; parametrische vergelijking schijnbare baan planeet mars met deferent mars
    //n[i]=xm/2*sin(i)+(r2/2)*sin(.5*i); //asign y;  parametrische vergelijking schijnbare baan planeet mars met deferent mars
  }



  bg = loadImage("data/sky.jpg"); //achtergrond scherm sterrenhemel
}


void draw() {
  background(bg); //achtergrond met sterrenhemel
  //background(255); //achtergrond wit
  noFill();
  stroke(0);
  translate(width/2, height/2);

  //lights();
  ambientLight(55, 255, 55); //omgevingslicht
  pointLight(255, 255, 255, 0, 0, 0); //licht van de zon

  rotate(2); //rotatie gehele scherm in radialen
  rotateX(-1.01); //rotatie x-as in radialen
  rotateY(-1.12); //rotatie y-as in radialen
  //-----------------------------------------------------------------
  //s = fm-fa; //match brandpuntsafstanden aarde en mars

  assenKruis();

  //aarde
  //baan(xa, xa, 0, color(58, 16, 229), 0);

  //x5a =map(aa*cos(t), 0, 5, 0, width); //parametrische vergelijking x=coordinaat hemelbaan aarde en planeet aarde
  //y5a =map(ba*sin(t), 0, 5, 0, height); //parametrische vergelijking y-coordinaat hemelbaan aarde en planeet aarde

  //fa = map(brandpuntaarde, 0, 5, 0, width); //gemapte brandpunts-coordinaat aarde; brandpunt aangepast aan pixels van het computerscherm


  //stroke(58, 16, 229); //kleur hemelbaan
  //ellipse(0, 0, xa, ya); //hemelbaan aarde
  //stroke(0); //kleur tekenlijnen neutraal

  //ellipse(-fa, 0, 13, 13); //brandpunt aarde

  //ellipse(x5a, y5a, 8.504, 8.504); //planeet aarde

  //------------------------------------------------------------------    

  //Mars

  //baan(xm, ym, s, color(250, 30, 38), -0.0314);



  //pushMatrix();
  //rotateY(-0.0314); //inclinatie van de baan van mars 1,2 graden tov de ecliptica van de aarde

  //x5m =map(am*cos(.5*t), 0, 5, 0, width); //parametrische vergelijking x-coordinaat hemelbaam mars en planeet mars
  //y5m =map(bm*sin(.5*t), 0, 5, 0, height);//parametrische vergelijking y-coordinaat hemelbaan mars en planeet mars

  //stroke(250, 30, 38); //kleur planeet mars
  //ellipse(s, 0, xm, ym); //hemelbaan mars
  //stroke(0); //neutrale kleur tekenlijnen

  //ellipse(s-fm, 0, 13, 13); //brandpunt mars

  //ellipse(x5m+s, y5m, 24.5, 24.5); //planeet mars
  //popMatrix();

  //---------------------------------------------------------------

  //3D aarde
  planeet(aa, ba, 8, 0, color(58, 16, 229), 0, 1);
  //pushMatrix();
  //translate(x5a, y5a);
  //noStroke(); 
  //fill(58, 16, 229); //kleur blauw aarde
  //sphere(8);
  //popMatrix();

  //--------------------------------------------------------------
  //3D mars
  //planeet(am, bm, 4, s, color(250, 30, 38), -0.0314, 0.5);
  //pushMatrix();
  //rotateY(-0.0314);
  //translate(s+x5m, y5m);
  //noStroke();
  //fill(250, 30, 38); //kleur rood mars
  //sphere(4);
  //noFill();
  //popMatrix();

  //----------------------------------------------------------------

  //3D schijnplaneet Mars

  schijnPlaneet(xa/2, xa/2, 4, 0, color(250, 30, 38), 0, 0.5);
  //Epicirkel


  x0 =(xa/2)*cos(t);  //x-coordinaat; parametrische vergelijking deferent = omtrekbaan aarde
  y0 = xa/2*sin(t); //y-coordinaat; parametrische vergelijking deferent = omtrek aarde

  //x0m = xm/2*cos(t); //x-coordinaat parametrische vergelijking deferent planeet mars;
  //y0m = xm/2*sin(t);//y-coordinaat parametrische vergelijking deferent planeet mars;

  x1 =xa/2*cos(t)+(r2/2)*cos(.5*t); //x-coordinaat parametrische vergelijking hulpcirkel of epicycle rakend aan deferent aarde
  y1 = xa/2*sin(t)+(r2/2)*sin(.5*t); //y-coordinaat parametrische vergelijking hulpcirkel of epicycle rakend aan deferent aarde

  //x0m1 = xm/2*cos(t)+(r2/2)*cos(.805*t); //x-coordinaat parametrische vergelijking hulpcirkel of epicycle rakend aan deferent mars
  //y0m1 = xm/2*sin(t)+(r2/2)*sin(.805*t); //y-coordinaat parametrische vergelijking hulpcirkel of epicycle rakend aan deferent mars

  stroke(255, 0, 0); //lijnkleur deferent = omtrek aarde

  //ellipse(0, 0, xa, xa); //omtrek deferent = omtrek aarde
  //ellipse (0,0, xm,xm); // deferent mars

  fill(0, 255, 0); // //kleur groen middelpunt epicycle of hulocirkel
  //ellipse(x0, y0, 4.5, 4.5); //middelpunt epicycle of hulpcirkel rakend aan deferent aarde
  //ellipse(x0m,y0m,4.5,4.5); //middelpunt epicycle of hulpcirkel rakend aan deferent mars

  noFill(); //kleur transparant

  //ellipse(x0, y0, r2, r2); //omtrek epicycle of hulocirkel rakend aan deferent aarde
  //ellipse(x0m,y0m,r2,r2); //omtrek epicycle of hulpcirkel rakend aan deferent mars


  //line(0, 0, x0, y0); //straal deferent aarde
  //line(0,0,x0m,y0m); //straal deferent mars
  strokeWeight(.1); //lijndikte verbindingslijnen
  //line(x5a, y5a, x5m+s, y5m); //verbindingslijn aarde met planeet mars
  strokeWeight(1); //lijndikte straal epicycle
  stroke(0, 255, 0); //lijnkleur groen
  //line(x5a, y5a, x1, y1); //verbindingslijn aarde met schijnplaneet mars/////
  //line(x0, y0, x1, y1); //straal epicycle rakend aan deferent aarde
  //line(x0m,y0m,x0m1,y0m1); //straal epicycle rakend aan deferent mars


  for (i=0; i<width; i++) {
    strokeWeight(8); //dikte schijnplaneet mars in 2D
    stroke(0255, 51, 51); //kleur schijnplaneet mars in 2D
    //point(x1, y1); //middelpunt schijnplaneet mars in 2D
    strokeWeight(1); //dikte schijnbaan van schijnplaneet mars
    point(m[i], n[i]); //schijnbaan van schijnplaneet mars


    //ellipse(x1, y1, r3, r3); //omtrek schijnplaneet mars in 2D rakend aan deferent aarde
    //ellipse(x0m1,y0m1,r3,r3); //omtrek schijnplaneer mars in 2D rakend aan deferent mars
    stroke(0);
  }

  t+=0.01;
}

void assenKruis() {
  strokeWeight(.11); //lijndikte
  stroke(255, 0, 255); //lijnkleur paars
  line(-ya, 0, ya, 0); // y-as positiekruis
  line(0, -xa, 0, xa); //x-as positiekruis
  stroke(0); //lijnkleur neutraal
  strokeWeight(1); //lijndikte normaal
}

void  baan(float afstandA, float afstandB, float brandpunt, color kleur, float rt) {
  pushMatrix();
  rotateY(rt); //inclinatie van de baan van mars 1,2 graden tov de ecliptica van de aarde
  stroke(kleur); //kleur planeet mars
  ellipse(brandpunt, 0, afstandA, afstandB); //hemelbaan mars
  //stroke(0); //neutrale kleur tekenlijnen

  // ellipse(s-fm, 0, 13, 13); //brandpunt mars

  //ellipse(x5m+s, y5m, 24.5, 24.5); //planeet mars
  popMatrix();
}


void planeet(float afstandA, float afstandB, float diam, float brandpunt, color kleur, float rt, float v) {
  float xpos =map(afstandA*cos(v*t), 0, 5, 0, width); //parametrische vergelijking x-coordinaat hemelbaam mars en planeet mars
  float ypos =map(afstandB*sin(v*t), 0, 5, 0, height);//parametrische vergelijking y-coordinaat hemelbaan mars en planeet mars
  pushMatrix();
  rotateY(rt);
  translate(brandpunt+xpos, ypos);
  noStroke();
  fill(kleur); //kleur rood mars
  sphere(diam);
  noFill();
  popMatrix();
}


void schijnPlaneet(float afstandA, float afstandB, float diam, float brandpunt, color kleur, float rt, float v) {

  float xapos =(xa/2)*cos(t);  //x-coordinaat; parametrische vergelijking deferent = omtrekbaan aarde
  float yapos = xa/2*sin(t); //y-coordinaat; parametrische vergelijking deferent = omtrek aarde
  float xapos1 =xa/2*cos(t)+(r2/2)*cos(v*t); //x-coordinaat parametrische vergelijking hulpcirkel of epicycle rakend aan deferent aarde
  float yapos1 = xa/2*sin(t)+(r2/2)*sin(v*t); //y-coordinaat parametrische vergelijking hulpcirkel of epicycle rakend aan deferent aarde

  pushMatrix();
  rotateY(rt);
  translate(xapos1, yapos1);
  fill(kleur);
  sphere(diam);
  noFill();
  popMatrix();
}
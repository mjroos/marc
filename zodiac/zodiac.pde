String zodiac[] ={"Ram", "Vissen", "Waterman", "Steenbok", "Boogschutter", "Schorpioen", "Weegschaal", "Maagd", "Leeuw", "Kreeft", "Tweeling", "Stier"};
String datum[] = {"21 maart", "19 feb", "20 jan", "22 dec", "22 nov", "23 okt", " 23 sep", "23 aug", "23 juli", "21 juni", "21 mei", "20april"};
int c;
float q;
float z;
float u = 0.0;
float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
float x4;
float y4; 
float x4a;
float y4a;

float x5;
float y5; 

float x5a;
float y5a; 

float x6;
float y6;

float x7;
float y7;

float x7a;
float y7a;

float x8;
float y8;

void setup() {

  size(500, 500);
}

void draw() {
  background(250);

  float x = cos(TWO_PI); //centrum volvelle
  float y = sin(TWO_PI); //centrum volvellde
  c=0; 

  //x1 = 100*cos(u);
  //y1 = 100*sin(u);

  x2 = 115*cos(u); //x-coordinaat bewegende wijzer langs stilstaande dierenriem
  y2 = 115*sin(u); //y-coordinaat bewegende wijzer langs stilstaande dierenriem

  x7 = 80*cos(PI);
  y7 = 80*sin(PI);

  x7a = 80*cos(PI-(10*u));
  y7a = 80*sin(PI-(10*u));

  x8 = 150*cos(10*-u);
  y8 = 150*sin(10*-u);

  translate(width/2, height/2);
  textSize(20);
  //text("Precessie van de Equinoxen", 0, -240);
  text("Zodiac", 0, -240);
  textSize(12);

  fill(194, 194, 214);
  ellipse(x, y, 230, 230); //buitenband dierenriem
  fill(0, 153, 0);
  ellipse(x, y, 200, 200);//binnenband dierenriem
  fill(255, 255, 0);
  ellipse(x, y, 50, 50); //zon
  text("zon", 30, -25);
  fill(0);

  text("Herfstpunt", -155, 30);
  text("Lentepunt", 155, 30);
  text("Zomerwende", 0, -125);
  text("Winterwende", 0, 180);
  noFill();

  ellipse(x, y, 160, 160);//ecliptica aarde
  fill(0, 0, 255);
  ellipse(x7, y7, 20, 20); //aarde vaststaand tegenover het lentepunt
  text("Aarde", x7, y7-25);
  //ellipse(x7a, y7a, 20, 20); //aarde bewegend in zijn baan
  //text("Aarde", x7a, y7a-25);
  //line(x7a, y7a, x8, y8); //aanwijzer draaiende aarde langs de ecliptica
  noFill();
  strokeWeight(4);
  //point(x8, y8); //pointer aanwijzer bewegende aarde langs ecliptica
  strokeWeight(1);


  strokeWeight(8);
  point(x, y);
  point(x1, y1); //pointer lentepunt
  point(100, 0); //pointer lentepunt
  //point(x2,y2); //bewegende pointer bij stilstaande dierenriem
  strokeWeight(1);
  stroke(250, 0, 0);
  //line(x,y,x2,y2); //bewegende wijzer bij stilstaande dierenriem
  line(x7, y7, 130, 0); //stilstaande wijzer bij bewegende dierenriem
  stroke(0);


  for (float i = 0; i < TWO_PI; i+=(TWO_PI/12)) {


    x3 = 100*cos(i);
    y3 = 100*sin(i);

    x4 = 115*cos(i); //x-coordinaat stilstaande pointer voor de datums langs de dierenriem
    y4 = 115*sin(i); //y-coordinaat stilstaande pointer voor de datums langs de dierenriem

    x4a = 115*cos(i-u); //x-coordinaat bewegende pointer voor de sterren langs de dierenriem
    y4a = 115*sin(i-u); //y-coordinaat bewegende pointer voor de sterren langs de dierenriem

    x5 = 150*cos(i); //x-coordinaat stilstaande dierenriem
    y5 = 150*sin(i); //y-coordinaat stilstaande dierenriem

    x5a = 150*cos(i-u); //x-coordinaat bewegende dierenriem
    y5a = 150*sin(i-u); //y-coordinaat bewegende dierenriem

    x6 = 150*cos(i); //x-coordinaat datums langs dierenriem
    y6 = 150*sin(i); //y-coordinaat datums langs dierenriem



    if ( c<12) {

      //println(zodiac[c]);
      fill(0);
      textAlign(CENTER, CENTER);
      text(zodiac[c],x5,y5); //stilstaande dierenriem (moment jaar 0, zon in teken ram)
      //text(zodiac[c], x5a, y5a); //bewegende dierenriem als gevolg van de precessie
      text(datum[c], x6, y6+15);
    }
    c++;
    strokeWeight(4);
    stroke(0, 0, 0);
    //point(x3,y3); //wijzerpointer
    point(x4, y4); //stilstaande pointers datums langs dierenriem
    stroke(250, 0, 0);
    //point(x4a, y4a); //bewegende pointers sterren langs dierenriem
    stroke(0);
    strokeWeight(1);

    //line(x3,y3,x4,y4); //wijzer
  }

  q= (u/PI)*180; //aantal graden
  z= u * 4106.19; //aantal jaren in relatie met het aantal graden

  //text("Precessie is " + " " + round(q) + " " + "graden", 0, -180);
  //text(round(z) + " " + "jaar", 0, -200);

  u+=.0003;
}
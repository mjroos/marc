class Hemelbaan {
Planeet mercurius;
Planeet venus;
Planeet aarde;
Planeet mars;
Planeet jupiter;

Moon maan;
Moon jupiterMaan1;
Moon jupiterMaan2;
Moon jupiterMaan3;

  float x;
  float y;
  float a;
  float b;
  float f;
  float z=2;


  
  Hemelbaan(float xpos, float ypos,float aphelium, float perihelium, float brandpunt){
    
  //mercurius = new Planeet(color(242,158,46),58,58,20,20, 0, 0.062);  
  //venus = new Planeet(color(255,268,34),108, 108,60,60, 0, 0.024);
  aarde = new Planeet(color(58,16,229),152, 147, 60, 60, 2.5, 0.00615);
  maan =     new Moon(color(80,150,60),152, 147, 20, 20, 2.5, 0.00615,0.08,40);
  //jupiter = new Planeet(color(183,12,18),815, 740, 710,710,37.5,0.00125);
  //jupiterMaan1 =     new Moon(color(80,150,60),815, 740, 20, 20, 37.5, 0.00125,0.02,80);
  //jupiterMaan2 =     new Moon(color(80,150,60),815, 740, 20, 20, 37.5, 0.00125,0.03,85); 
  //jupiterMaan3 =     new Moon(color(80,150,60),815, 740, 20, 20, 37.5, 0.00125,0.04,90);
  //mars = new Planeet(color(250,30,38),250, 208, 30,30,22,0.0079);
  
  x =xpos+brandpunt;
  y = ypos;
  a = (aphelium*2)*z;
  b=(perihelium*2)*z;
  f = (brandpunt*z);

  }
  
  void display() {
 lijn();  
  aarde.coor();  
  //mercurius.coor();
  //venus.coor();
  //jupiter.coor();
  //aarde.tekst("Earth");
  maan.mcoor();
 //maan.tekst("Moon");
 //jupiterMaan1.mcoor();
 //jupiterMaan2.mcoor(); 
 //jupiterMaan3.mcoor(); 
 //mars.coor(); 
  noFill();
  strokeWeight(.1);
  ellipse(x,y,a,b); //hemelbaan
  //println(x,y,a,b);
}

void lijn(){
  
 strokeWeight(.5);
  line(0, -height/2,0,height/2);
  line(-width/2,0,height/2,0);
  for (int i = -width; i < width*2; i += 50) {
    fill(129, 206, 15);
  
    line((-width/2+i)*z, -5*z, (-width/2+i)*z, 5*z);
    line(-5*z,(-height/2+i)*z,5*z,(-height/2+i)*z);
  } 

}
}
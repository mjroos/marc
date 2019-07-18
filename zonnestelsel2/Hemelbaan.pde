class Hemelbaan {
Planeet mercurius;
Planeet venus;
Planeet aarde;
Planeet mars;
Planeet jupiter;
Planeet saturnus;
Planeet uranus;
Planeet neptunus;
Planeet pluto;

Moon maan;
Moon jupiterMaan1;
Moon jupiterMaan2;
Moon jupiterMaan3;
Moon jupiterMaan4;
Moon marsMaan1;
Moon marsMaan2;

  float x;
  float y;
  float a;
  float b;
  float f;
  float z=1;


  
  Hemelbaan(float xpos, float ypos,float aphelium, float perihelium, float brandpunt){
    
  mercurius = new Planeet(color(242,158,46),58,58,20,20, 0, 0.0619);  
  venus = new Planeet(color(255,268,34),108, 108,60,60, 0, 0.0242);
  
  aarde = new Planeet(color(58,16,229),152, 147, 60, 60, 2.5, 0.0149);
  
 
  maan =     new Moon(color(80,150,60),152, 147, 20, 20, 2.5, 0.0149,0.179,20);
  
  jupiter = new Planeet(color(183,12,18),815, 740, 710,710,37.5,0.00126);
  jupiterMaan1 =     new Moon(color(80,150,60),815, 740, 20, 20, 37.5, 0.00126,0.03,190);
  jupiterMaan2 =     new Moon(color(80,150,60),815, 740, 20, 20, 37.5, 0.00126,0.0149,210); 
  jupiterMaan3 =     new Moon(color(80,150,60),815, 740, 20, 20, 37.5, 0.00126,0.01,230);
  jupiterMaan4 =     new Moon(color(80,150,60),815, 740, 20, 20, 37.5, 0.00126,0.009,250);
  
  mars = new Planeet(color(250,30,38),250, 208, 30,30,22,0.00794);
  marsMaan1 =     new Moon(color(80,150,60),250, 208, 10, 10, 22, 0.00794,0.12,8);
  marsMaan2 =     new Moon(color(80,150,60),250, 208, 10, 10, 22, 0.00794,0.06,15);
  
  saturnus = new Planeet(color(229,137,16), 1505, 1347,600,600, 79, 0.0005);
  
  uranus = new Planeet(color(150,229,16), 3000, 2734, 250, 250, 133,0.000178);
  
  neptunus = new Planeet(color(210,39,214), 4531, 4454, 247, 247, 38.5, 0.0000906);
  
  pluto = new Planeet(color(214,103,39), 7370, 4440, 11, 11, 1465, 0.0000603);
  
  x =xpos+brandpunt;
  y = ypos;
  a = (aphelium*2)*z;
  b=(perihelium*2)*z;
  f = (brandpunt*z);

  }
  
  void display() {
 lijn();  
   
  mercurius.coor();
  mercurius.tekst("Mercurius");
  
  venus.coor();
   venus.tekst("Venus");
   
  aarde.coor(); 
  aarde.tekst("Earth");
  maan.mcoor();
 //maan.tekst("Moon");
 
  mars.coor(); 
  mars.tekst("Mars");
 marsMaan1.mcoor();
 marsMaan2.mcoor();
 
 jupiter.coor();
 jupiter.tekst("Jupiter");
 jupiterMaan1.mcoor();
 jupiterMaan2.mcoor(); 
 jupiterMaan3.mcoor(); 
 jupiterMaan4.mcoor(); 
 
 saturnus.coor(); 
 saturnus.tekst("Saturnus");
 
 uranus.coor(); 
 uranus.tekst("Uranus");
 
 neptunus.coor(); 
 neptunus.tekst("Neptunus");
 
 pluto.coor(); 
 pluto.tekst("Neptunus");
 
 
  noFill();
  strokeWeight(1);
  ellipse(x,y,a,b); //hemelbaan
  //println(x,y,a,b);
}

void lijn(){
  
 strokeWeight(1);
  line(0, -height,0,height);
  line(-width,0,height,0);
  for (int i = -width*2; i < width*2; i += width/(width/100)) {
    //fill(129, 206, 15);
  
    line((-width/2+i)*z, -5*z, (-width/2+i)*z, 5*z);
    line(-5*z,(-height/2+i)*z,5*z,(-height/2+i)*z);
    textSize(10);
    text(i, (0 +i)*z, -5*z);
    text(i, (-5*z), (0+i)*z);
  } 

}
}
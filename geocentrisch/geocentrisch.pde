Planet mercurius1;
Planet mercurius2;
Planet venus1;
Planet venus2;
Planet aarde1;
Planet aarde2;
Planet mars1;
Planet mars2;
Planet jupiter1;
Planet jupiter2;
Planet saturnus1;
Planet saturnus2;
Planet uranus1;
Planet uranus2;
Planet neptunus1;
Planet neptunus2;
Planet pluto1;
Planet pluto2;
Planet sun1;
Planet sun2;
Planet maan1;
Planet maan2;


PFont f;

float bs = 1;  //schaal periodebanen van de planeten om de zon, standaard = 10
float ps = .4;  //schaal voor de planeten, standaard = 3

void setup() {
  size(800,800);
  f = createFont("Arial",15,true);
  textFont(f,20);        
  textAlign(LEFT);
  
 
 aarde1=new Planet(color(42,11,222,100),0/bs,0/bs);//242,158,46
 aarde2=new Planet(color(42,11,222,100),0/bs, 0/bs);
  
  mercurius1=new Planet(color(242,158,46),58/bs,58/bs);
  mercurius2=new Planet(color(242,158,46),58/bs, 58/bs);
  
  maan1=new Planet(color(255,255,255),25/bs, 25/bs);
  maan2=new Planet(color(255,255,255),25/bs, 25/bs);
  
  venus1=new Planet(color(255,255,255),108/bs, 108/bs);
  venus2=new Planet(color(255,255,255),108/bs, 108/bs);
    
  sun1=new Planet(color(255, 255, 26),150/bs, 150/bs); //42,11,222
  sun2=new Planet(color(255, 255, 26),150/bs, 150/bs);
  
  mars1=new Planet(color(250,30,38),218/bs, 218/bs);
  mars2=new Planet(color(250,30,38),218/bs, 218/bs);
  
  jupiter1=new Planet(color(183,12,18),400/bs, 400/bs); //778
 jupiter2=new Planet(color(183,12,18),400/bs, 400/bs); //778
  
  
  saturnus1=new Planet(color(250,30,38),700/bs, 700/bs); //1426
  saturnus2=new Planet(color(250,30,38),700/bs, 700/bs); //1426
  
  uranus1=new Planet(color(250,30,38),2870/bs, 2870/bs);
  uranus2=new Planet(color(250,30,38),2870/bs, 2870/bs);
  
  neptunus1=new Planet(color(250,30,38),4498/bs, 4498/bs);
  neptunus2=new Planet(color(250,30,38),4498/bs, 4498/bs);
  
  pluto1=new Planet(color(250,30,38),5907/bs, 5907/bs);
  pluto2=new Planet(color(250,30,38),5907/bs, 5907/bs);
  
}

void draw() {
  background(255);
  text("Geocentrich Heelal",10,750);
  text("Aristotelus, 384 v Chr - 322 v Chr / Claudius Ptolomaeus, 87 na Chr. - 150 na Chr.",10,780 );
  //text("door Marc Roos. dec.2015",600,780 );
  
  translate(width/2,height/2);
  
  maan1.cirkel(0,0,58/bs, 58/bs);
  maan2.coor(2/ps,0.062);
  maan2.tekst("Maan");
  
  mercurius1.cirkel(0,0,58/bs, 58/bs);
  mercurius2.coor(2/ps,0.062);
  mercurius2.tekst("Mercurius");
  
  venus1.cirkel(0,0,108/bs, 108/bs);
  venus2.coor(6/ps,0.024);
  venus2.tekst("Venus");
  
  sun1.cirkel(0,0,150/bs, 150/bs);
  sun2.coor(12/ps,0.0149);
  sun2.tekst("Zon");
    
  mars1.cirkel(0,0,218/bs, 218/bs);
  mars2.coor(3/ps,0.0079);
  mars2.tekst("Mars");
  
  jupiter1.cirkel(0,0,400/bs, 400/bs);//778
  jupiter2.coor(16/ps,0.00125);//71
  jupiter2.tekst("jupiter");
  
  saturnus1.cirkel(0,0,700/bs, 700/bs);//1426
  saturnus2.coor(16/ps,0.0005); //60
  saturnus2.tekst("saturnus");
  
  uranus1.cirkel(0,0,2870/bs, 2870/bs);
  uranus2.coor(25/ps,0.000177);
  uranus2.tekst("uranus");
  
  
  neptunus1.cirkel(0,0,4498/bs, 4498/bs);
  neptunus2.coor(24/ps,0.00009);
  neptunus2.tekst("neptunus");
  
  pluto1.cirkel(0,0,5907/bs, 5907/bs);
  pluto2.coor(3/ps,0.00006);
  pluto2.tekst("pluto");
  
  aarde1.cirkel(0,0,0/bs, 0/bs);
  aarde2.coor(6/ps,0.00006);
  aarde2.tekst("aarde");
  
 }


  
//class  
class Planet {
  
//data - global variables, non oop
color c;
float sbaan;
float baan;
float baan2;
float diamAarde;
float xpos;
float ypos;
float subx;
float suby;
float t=0;
float[] yvalues;
float theta;
float theta_vel;
float theta_acc;




  
  


//constructor
Planet(color tempc, float tempbaan, float tempbaan2){
  c = tempc;
  baan=tempbaan;
   baan2=tempbaan2;
}

//function
void cirkel(float dx, float dy, float diameter, float diameter2) {
  ellipseMode(CENTER);
  noFill();
  ellipse(dx, dy, diameter, diameter2);
  xpos=dx;
  ypos=dy;
  baan=diameter;
  baan2=diameter2;
  //sbaan=width-(width/2+baan/2-diam/2);
  }
  

void coor(float diam, float speed){
  
  fill(c);
  ellipseMode(CENTER);
  //sbaan=320-baan/2+diam;
  println(sbaan);
     subx = (baan/2) * cos(theta);
       suby = (baan2/2) * sin(theta);
       
       ellipse(subx, suby, diam, diam);
   
theta_vel = speed;
  theta += theta_vel;
   }

void tekst(String naam) {
  textSize(15);
  fill(0, 102, 153);
  text(naam, (subx+diamAarde), (suby+diamAarde));
}




}
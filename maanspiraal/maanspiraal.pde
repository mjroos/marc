
Hemelbaan mercuriusBaan;
Hemelbaan venusBaan;
Hemelbaan aardBaan;
Hemelbaan marsBaan;
Hemelbaan jupiterBaan;


void setup() {
  size(800,800);
  
  //mercuriusBaan = new Hemelbaan(0,0,58,58, 0); //x,y,aphelium,perihelium,brandpunt
  //venusBaan = new Hemelbaan(0,0,108,108, 0);
  aardBaan = new Hemelbaan(0,0,152,147,2.5);
  //marsBaan = new Hemelbaan(0,0,250, 208, 22);
  //jupiterBaan = new Hemelbaan(0,0,815,740, 37.5);
}

void draw(){
  //background(255);
   if(mousePressed) {
     noLoop();
   }
   
  pushMatrix();
  translate(width/2, height/2);
   
//noStroke();
//mercuriusBaan.display();
//venusBaan.display();
//noStroke();
aardBaan.display();
//stroke(255);
//marsBaan.display();
//jupiterBaan.display();


popMatrix();

}
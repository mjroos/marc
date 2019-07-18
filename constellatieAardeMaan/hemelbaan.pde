class Hemelbaan {
  

Planeet aarde;

  float x;
  float y;
  float a;
  float b;
  float f;
  float z=1;
  
  Hemelbaan(float xpos, float ypos,float aphelium, float perihelium, float brandpunt){
       
  aarde = new Planeet(color(58,16,229),152, 147, 120, 120, 2.5, 0.0149);
  
  
  x =xpos+brandpunt;
  y = ypos;
  a = (aphelium*2)*z;
  b=(perihelium*2)*z;
  f = (brandpunt*z);

  }
  
  void display() {
  
    if(keyPressed) {
  if(key=='1') {
    orbit=true;}
   else if (key=='2') {
          orbit=false;
    }
     
    }
    
        /*
 if(orbit){
   lijn();
   stroke(255);
     ellipse(x,y,a,b);
 
 } 
 */

 //textSize(20);
  //lijn();
   //stroke(255);
     //ellipse(x,y,a,b);
     aarde.coor("Earth"); 
  
 
 
  noFill();
  stroke(255);
  strokeWeight(1);

 
  //println(x,y,a,b);
}

void lijn(){
 stroke(255);
 strokeWeight(1);
  line(0, -2*height,0,2*height);
  line(-width,0,height,0);
  for (int i = -width*2; i < width*2; i += width/(width/100)) {
    //fill(129, 206, 15);
  
    line((-width/2+i)*z, -5*z, (-width/2+i)*z, 5*z);
    line(-5*z,(-height/2+i)*z,5*z,(-height/2+i)*z);
   
    textSize(10);
    text(i, (0 +i)*z, -5*z);
    text(i, (-5*z), (0+i)*z);
    noStroke();
  } 

}



}
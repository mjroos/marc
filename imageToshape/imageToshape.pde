
import processing.pdf.*;
PShape ps;
PImage img;

void setup(){
  size(600,600);

  img = loadImage("rotterdam.jpg");
  
  
}



void draw(){

  vorm();


}

void vorm(){
  loadPixels();
  img.loadPixels();
  for(int x = 0; x < width; x++){
  for(int y = 0; y <height; y ++){
    int loc = x+y*width;
    pixels[loc]=img.pixels[loc];
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
    float d = dist(x,y, (width/2),(height)/2);
    //float factor=map(d, 0,200,0,2);
    pixels[loc] = color(r+d,g+d,b+d);
  
    //pixels[x+y*width]=color(d);
  }
}
updatePixels();
 
  
}

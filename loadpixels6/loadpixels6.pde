PImage vet;

void setup(){
size(905,585);
vet = loadImage("vet.jpg");
}

void draw(){
loadPixels();
vet.loadPixels();
for(int x = 0; x < width; x++){
  for(int y = 0; y <height; y ++){
    int loc = x+y*width;
    pixels[loc]=vet.pixels[loc];
    float r = red(vet.pixels[loc]);
    float g = green(vet.pixels[loc]);
    float b = blue(vet.pixels[loc]);
    float d = dist(x,y, (width/2),(height)/2);
    //float factor=map(d, 0,200,0,2);
    pixels[loc] = color(r+d,g+d,b+d);
    
    //pixels[x+y*width]=color(d);
  }
}
updatePixels();
//noLoop();
save("vitruvius.jpg");
}
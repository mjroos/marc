//perlin cirkel with z-axis



//perlin cirkel with phase


//perlin cirkel


// cirkel
int maxValue =5;
float phase=0;
float zoff =0;

void setup(){
//background(0);
size(600,600);

}



void draw(){
background(0);
stroke(255);
fill(255);
textSize(20);
text("Irregular Ellipse with Perlin Noise",50,50);
noFill();

translate(width/2, height/2);

cirkel();

//noLoop();
}

void cirkel(){

beginShape();

for (float a = 0; a < TWO_PI; a+=0.1){
//int xoff= cos(a)+1;
//int yoff = sin(a+)+1;
strokeWeight(3);
float xoff= map(cos(a),-1,1,0,maxValue);
float yoff= map(sin(a),-1,1,0,maxValue);

float r = map(noise(xoff,yoff,zoff),0,1, 150,300);
float x = r * cos(a+phase);
float y = r * sin(a+ phase);
fill(255,0,255,100);
vertex(x,y);

}

endShape(CLOSE);
phase+=.01;
zoff+=.02;
}
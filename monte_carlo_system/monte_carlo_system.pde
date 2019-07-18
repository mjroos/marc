//Monte Carlo Algoritme

int r = 200;
int totalCount=0;
int circleCount=0;
PGraphics pg;
double pi;

void setup(){
size(402,402);
background(0);
translate(width/2,height/2);
strokeWeight(4);
stroke(255);
noFill();
rectMode(CENTER);
rect(0,0, 2*r,2*r);
ellipse(0,0,2*r, 2*r);
strokeWeight(1);

pg= createGraphics(150,20);
}



void draw(){
//background(255);

translate(width/2,height/2);


for(int i = 0; i < 100; i++){
float x =random(-r,r);
float y = random(-r,r);

double d = ((double)x*(double)x + (double)y*(double)y);

totalCount++;

if(d < (double)r*(double)r){
stroke(0,255,0);
circleCount+=1;
}else{
stroke(255,0,0);

}

point(x,y);



 pi = (double)4* ((double)circleCount / (double)totalCount);



}

pg.beginDraw();
  pg.background(255);
  pg.fill(0);
pg.textSize(12);
pg.text("PI" + " " + " = " +  pi, 0,15); pg.endDraw();
  
  // Draw the offscreen buffer to the screen with image()
  image(pg, -70, 0); 


println(totalCount + " " + pi);
}

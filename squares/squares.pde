float a = 1;


void setup() {
  size(800, 800);
  colorMode(HSB);
  rectMode(CENTER);
}

void draw() {
   background(102,7,57);
  fill(255);
  textSize(20);
  text("Recursion", 50,30);
 
  translate(width/2,height/2);
  
  //rotate(45);
  reg(0,0, 200);
  save("output/reg1.jpg");
  noLoop();
}

void reg(float x, float y, float d) {
  stroke((255));
  //noStroke();
  fill(random(100,255),255,255,100);
  
  //noFill();
  if (d >10) {
    rect(x, y, d, d);
    reg(x + (.75*d), y,.5*d);
    reg(x - (.75*d), y, .5*d);
    reg(x , y-.75*d, 0.5*d);
    reg(x , y+.75*d, 0.5*d);
  }
 
}

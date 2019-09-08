//Gplden Spiral
//M.Roos
//08/09/2019
//https://github.com/mjroos/marc/blob/master/golden_spiral3/golden_spiral3.pde

int h = 400;
int a =0;

void setup() {
  size(647, 400);
  
}

void draw() {
  background(255);
  textSize(20);
  fill(0);
  text("Golden Spiral, Fibonacci", 30,325);
  text("The Eye of God", 30,350);
 
  stroke(0, 80);
  strokeWeight(1);
  line(0, 0, 647, 400);
  line(247, 647, 647, 0);
  
  strokeWeight(2);
  stroke(255, 0, 0);
  noFill();

  for (int i = 0; i <a; i++) {
    rec(h);
  }


  delay(1000);
  if (a < 20) {
    a+=1;
  } else {
    delay(2000);
    a = 0;
  }
  //saveFrame("output/goldenspiral-####.jpg");
}


float rec(float h) {
  rect(0, 0, h, h);
  arc(h, h, 2*h, 2*h, PI, PI + HALF_PI);
  translate(h*1.618, 0);
  scale(1/1.618);
  rotate(PI/2);
  return h;
}

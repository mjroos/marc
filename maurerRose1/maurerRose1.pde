float n = 5;
float d = 97;
float s = 250;

void setup() {
  size(600, 600);
}


void draw() {
  background(53);
  translate(width/2, height/2);
  stroke(255);
  strokeWeight(1);

  textSize(20);
  text("Maurer Rose" + ", " + "n = 6" + ", " + "d = 71", -280, -280);
  text("https://en.wikipedia.org/wiki/Maurer_rose", -280, -255);
  

  noFill();

  beginShape();
  for (int i = 0; i <= 360; i++) {
    float k = radians(i * d);
    float r =sin(n * k);
    float x = s*r*cos(k);
    float y =s * r*sin(k);
    //point(x, y);

    vertex(x, y);
  }
  endShape();

  noFill();
  beginShape();
  strokeWeight(3);
  stroke(255, 0, 255);
  for (int i = 0; i <= 360; i++) {
    float k = radians(i);
    float r =sin(n * k);
    float x = s*r*cos(k);
    float y =s * r*sin(k);
    //point(x, y);

    vertex(x, y);
  }
  endShape();
  
  save("output/rose2.jpg");
}

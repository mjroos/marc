PVector e1, e2, p1, p2, h, v;
float a = 0;                                //angle

void setup() {
  size(600, 600);
  e1 = new PVector(100, 0);                  //vector e1
  e2 = new PVector(0, -100);                 //vector e2
  v=new PVector(200, -200);                  //just a vector
}

void draw() {
  background(53);
  translate(width/2, height/2);
  stroke(255);
  strokeWeight(2);

  line(0, 0, e1.x, e1.y);
  line(0, 0, e2.x, e2.y);
  line(0, 0, v.x, v.y);

  head(e1);
  head(e2);
  head(v);

  tekst("Processing: Function Arrowhead, using the PVector", -275, -275);
  tekst("Hit a key for rotating the arrow", 0, 275);
  tekst("e1", e1.x, e1.y);
  tekst("e2", e2.x, e2.y);
  tekst("v", v.x, v.y);

  if (keyPressed) {
    rotation(v);                                       //function rotation
    a+=0.01;                                           //increasing the angle for the function rotation
  }
  
  saveFrame("output/arrowhead-####.jpg");
}




void tekst(String s, float x_, float y_) {            //function of the labels
  float x = x_;
  float y = y_;
  textSize(12);
  textAlign(LEFT);
  text(s, x+10, y);
}

void head(PVector v) {                                 //function of the arrowhead
  strokeWeight(2);
  h=v.copy();                                          //copy vector
  p1 = PVector.fromAngle(v.heading()+.22*PI);          //determine direction of the vector for left arrowhead
  p2 = PVector.fromAngle(v.heading()-.22*PI);          //determine direction of the vector for left arrowhead

  p1.normalize();                                      //set vectorlength to zero, only direction is important
  p2.normalize();                                      //set vectorlength to zero, only direction is important

  p1.mult(-20);                                        //set the length of the left wing of the arrowhead
  p2.mult(-20);                                        //set the length of the rightcwing of the arrowhead

  p1.add(h);                                           //add the left wing of the arrowhead to the end of the vector
  p2.add(h);                                           //add the right wing of the arrowhead to the end of the vector

  stroke(255, 0, 0);
  point(p1.x, p1.y);                                   //draw the endpoint of the left wing 
  line(v.x, v.y, p1.x, p1.y);                          //draw the left wing of the arrowhead

  stroke(0, 255, 0);
  point(p2.x, p2.y);                                   //draw the endpoint of the right wing 
  line(v.x, v.y, p2.x, p2.y);                          //draw the right wing of the arrowhead
}

void rotation(PVector e) {                             //function rotation
  float m = e.mag();
  float angle = e.heading();
  float x = m*cos(angle + a);
  float y = m*sin(angle + a);
  line(0, 0, x, y);
  PVector hat = new PVector(x, y);                      //vector for arrowhead
  head(hat);                                           //arrowhead
}

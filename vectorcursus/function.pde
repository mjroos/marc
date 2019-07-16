void show() {
  textAlign(CENTER, TOP);
  textSize(15);
  
  //STARTLOCATION
  stroke(255, 0, 0);
  p1 = new PVector(10, 100); //startpositie
  p1a = p1.copy(); //copy startpositie
  ellipse(p1.x, p1.y, 5, 5);
  line(0, 0, p1.x, p1.y);
  fill(255, 0, 0);
  text(s1, p1.x, p1.y);

  //ENDLOCATION
  textAlign(CENTER, BOTTOM);
  stroke(0, 255, 0);
  p2 = new PVector(100, -50); //nieuwe positie
  ellipse(p2.x, p2.y, 5, 5);
  line(0, 0, p2.x, p2.y);
  fill(0, 255, 0);
  text(s2, p2.x, p2.y);

  //DIRECTION
  stroke(0, 0, 255);
  p3 = p2.sub(p1); //pointer
  p3a = p3.copy();
  L = p3.mag();
  float d = p1.dist(p2);
  p3.normalize();
  p3a.normalize();
  p3.mult(L);
  p3a.mult(a); 
  ellipse(p3.x, p3.y, 5, 5);
  line(0, 0, p3.x, p3.y);
  fill(0, 0, 255);
  text(s3, p3.x, p3.y);

  //TRAVELER
  stroke(255, 0, 255); 
  p4 = p1a.add(p3a); //positie 1 + pointer = positie 2
  ellipse(p4.x, p4.y, 8, 8);
  line(p1.x, p1.y, p4.x, p4.y);
  fill(255, 0, 255);
  text(s4, p4.x, p4.y);
  text(s5, 0, 175);
}

void mousePressed() {
  a=0;
  running = true;
}

void keyPressed() {
  a=0;
  running = true;
}

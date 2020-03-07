//diameter aarde = 12756
//afstand aarde maan 383400 km
//massa aarde 5,9722×10^24 kg

class Aarde {
  ArrayList<PVector> earth;
  PVector A, a;
  PShape aarde;
  float r = 128;
  float bc;
  float d = 383;
  PVector bac;
  float mass = 219;
  Boolean gravitationalForce;
  Boolean centripetalForce;
  Boolean tidalPover;
  Boolean forces;


  Aarde() {
    earth = new ArrayList<PVector>();
    for (int i = 0; i< 360; i+=1) {
      float angle = map(i, 0, 360, 0, TWO_PI);
      float x = r*cos(angle);
      float y = r * sin(angle);
      A = new PVector(x, y);
      earth.add(A);
    }
  }

  //void points() {
  //  for (int i =0; i < earth.size(); i+=30) {
  //    PVector a = earth.get(i);
  //    strokeWeight(8);
  //    stroke(255, 0, 0);
  //    point(a.x, a.y);
  //  }
  //}

  void trans(ArrayList<PVector> other) {
    gravitationalForce = false;
    centripetalForce = false;
    tidalPover = false;

    if (keyPressed) {
      beginShape();
      for (int i =1; i < other.size(); i+=10) {
        PVector a = earth.get(i);
        PVector t = other.get(i);

        PVector aloc = new PVector(a.x+bac.x+bc*cos(c), a.y+bc*sin(c));
        PVector mloc = new PVector(t.x+bc+(d+bc)*cos(c), t.y+0+(d+bc)*sin(c));
        ////line(a.x+bac.x+bc*cos(c), a.y+bc*sin(c), t.x+bc+(d+bc)*cos(c), t.y+0+(d+bc)*sin(c));
        //line(aloc.x,aloc.y, mloc.x,mloc.y);
        PVector h = PVector.sub(aloc, mloc); //gravity
        PVector h1=h.copy(); //centerforce

        //GRAVITY
        //fill(0);
        float D = sqrt(sq(h.x)+sq(h.y));
        h.normalize();
        h.mult(-gravityForce(D));
        if (key == 'r' || key == 'R') {
          gravitationalForce = true;
          fill(255, 0, 0);
          head(h, aloc.x, aloc.y, color(255, 0, 0), 2);
          //line(aloc.x, aloc.y, aloc.x+h.x, aloc.y+h.y);
          //vertex(aloc.x+h.x, aloc.y+h.y);
          textFont(f2);
          textAlign(CENTER);
          text("Gravitation moon", 0, 300);
        } else {
          gravitationalForce = false;
        }

        //CENTERFORCE
        h1.normalize();
        h1.mult(centerForce());
        if (key == 'b' || key == 'B') {
          centripetalForce = true;
          fill(0);
          head(h1, (aloc.x), (aloc.y), color(0), 2);
          //vertex(aloc.x+h1.x, aloc.y+h1.y);
          textFont(f2);
          textAlign(CENTER);
          text("Centripetal force earth", 0, 300);
        } else {
          centripetalForce = false;
        }


        //GRAVITYFORCE SUB CENTERFORCE = TIDE  
        PVector h2 = PVector.add(h, h1);
        if (key == 't' || key == 'T') {
          tidalPover = true;
          fill(0, 0, 255, 50);
          head(h2, aloc.x, aloc.y, color(0, 0, 255), 1);
          strokeWeight(3);
          vertex(aloc.x+h2.x, aloc.y+h2.y);
          textFont(f2);
          textAlign(CENTER);
          text("Tidal power", 0, 300);
        } else {
          tidalPover = false;
        }
      }
      endShape(CLOSE);
    }

    fill(#64DB26, 150);
    ellipse(bac.x+bc*cos(c), bac.y+bc*sin(c), 2*r, 2*r); //aarde
    textFont(f2);
    fill(0);
    textAlign(CENTER);
    text("earth", bac.x+bc*cos(c), bac.y+bc*sin(c));
  }

  void barycenter(float ra, float rm, float dam) {
    bc = dam -(ra*dam)/(ra+rm);
    bac = new PVector(bc*cos(0), bc*sin(0));
    fill(0);
    strokeWeight(1);
    ellipse(bac.x, bac.y, 10, 10);
    ellipse(0, 0, 5, 5);
    fill(255, 0, 0);
    ellipse(bac.x+bc*cos(c), bac.y+bc*sin(c), 15, 15);
    noFill();
    //fill(#64DB26, 150);
    //stroke(#64DB26);
    //ellipse(bac.x+bc*cos(c), bac.y+bc*sin(c), 2*ra, 2*ra);

    for (int i =0; i < earth.size(); i+=30) {
      PVector a = earth.get(i);
      //strokeWeight(20);
      //point(a.x+bac.x+bc*cos(c), a.y+bc*sin(c));
    }
    if (keyPressed) {
      forces = false;
    } else {
      forces(maan.moon);
    }
    noFill();
  }

  float gravityForce(float D_) {
    float force = ((7000*mass*maan.mass)/sq(D_));
    return force;
  }

  float centerForce() {
    float freq = 0.005;
    float omega = 2 *PI * freq;
    float centerforce = mass*sq(omega)*r;
    return centerforce;
  }

  void head(PVector b, float x, float y, color c, int w) {      //function of the arrowhead
    float arrowsize = 10;
    pushMatrix();
    translate(x, y);
    strokeWeight(w);
    PVector q=b.copy();                                          //copy vector
    rotate(q.heading2D());
    float len = q.mag();
    stroke(c);
    line(0, 0, len, 0);
    line(len, 0, len-arrowsize, +arrowsize/2);
    line(len, 0, len-arrowsize, -arrowsize/2);
    popMatrix();
    //stroke(0, 0, 255);
  }

  void forces(ArrayList<PVector> other) {
    beginShape();
    for (int i =1; i < other.size(); i+=10) {
      PVector a = earth.get(i);
      PVector t = other.get(i);
      PVector aloc = new PVector(a.x+bac.x+bc*cos(c), a.y+bc*sin(c));
      PVector mloc = new PVector(t.x+bc+(d+bc)*cos(c), t.y+0+(d+bc)*sin(c));
      ////line(a.x+bac.x+bc*cos(c), a.y+bc*sin(c), t.x+bc+(d+bc)*cos(c), t.y+0+(d+bc)*sin(c));
      //line(aloc.x,aloc.y, mloc.x,mloc.y);
      PVector h = PVector.sub(aloc, mloc); //gravity
      PVector h1=h.copy(); //centerforce

      //GRAVITY
      //fill(0);
      float D = sqrt(sq(h.x)+sq(h.y));
      h.normalize();
      h.mult(-gravityForce(D));
      head(h, aloc.x, aloc.y, color(255, 0, 0), 2);
      //line(aloc.x, aloc.y, aloc.x+h.x, aloc.y+h.y);
      //vertex(aloc.x+h.x, aloc.y+h.y);

      //CENTERFORCE
      h1.normalize();
      h1.mult(centerForce());
      head(h1, (aloc.x), (aloc.y), color(0), 2);
      //vertex(aloc.x+h1.x, aloc.y+h1.y);

      //GRAVITYFORCE SUB CENTERFORCE = TIDE  
      PVector h2 = PVector.add(h, h1);
      fill(0, 0, 255, 50);
      head(h2, aloc.x, aloc.y, color(0, 0, 255), 1);
      strokeWeight(3);
      vertex(aloc.x+h2.x, aloc.y+h2.y);
    }
    endShape(CLOSE);
  }


  //void show() {
  //  ellipse(bc,0,2*(d+bc),2*(d+bc));
  //  aarde = createShape();
  //  aarde.beginShape();
  //  for (int i =0; i < earth.size(); i++) {
  //    a = earth.get(i);
  //    aarde.strokeWeight(3);
  //    aarde.stroke(0, 0, 255);
  //    aarde.fill(0, 255, 255);
  //    aarde.vertex(a.x, a.y);
  //  }
  //  aarde.endShape();
  //  shape(aarde, 0, 0);
  //}
}

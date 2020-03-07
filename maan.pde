//diameter 3476 km
//afstand aarde maan 383400 km
//massa maan 7,35×10^22kg


class Maan {
  ArrayList<PVector> moon;
  PVector M, v, t, m1;
  PShape maan;
  float r =35;
  float d = 383;
  float mass = 2.7;
  
  int direction = -1;

  Maan() {
    moon = new ArrayList<PVector>();
    for (int i = 0; i< 360; i+=1) {
      float angle = map(i, 0, 360, 0, TWO_PI);
      float x =r*cos(angle);
      float y = r * sin(angle);
      M = new PVector(x, y);
      moon.add(M);
      v=new PVector(c, c);
    }
  }

  void update() {
    c+=0.01*direction;
    M.add(v);
  }

  void points() {
    noStroke();
    for (int i =0; i < moon.size(); i+=30) {
      m1 = moon.get(i);
      // m1.add(t);
      //translate(m.x,m.y);
      strokeWeight(8);
      stroke(#F0B2F5);
      point(m1.x+aarde.bc+(d+aarde.bc)*cos(c), m1.y+ 0+(d+aarde.bc)*sin(c));
    }
  }

  void show() {
    noStroke();
    maan = createShape();
    maan.beginShape();
    for (int i =0; i < moon.size(); i++) {
      PVector m = moon.get(i);
      maan.strokeWeight(2);
      maan.stroke(#F0B2F5);
      maan.fill(#F0B2F5);
      maan.vertex(m.x, m.y);
      
    }
    maan.endShape();
    shape(maan,aarde.bc+(d+aarde.bc)*cos(c),0+(d+aarde.bc)*sin(c));
    textFont(f1);
    fill(0);
    textAlign(CENTER);
     text("moon", aarde.bc+(d+aarde.bc)*cos(c),0+(d+aarde.bc)*sin(c));
  }
}

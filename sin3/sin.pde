class Sin {
  int v;
  int w;
  float time = 0;
  FloatList wave;
  float x;
  float y;
  float prevx;
  float prevy;
  float radius;
  float n;

  Sin() {
    wave = new FloatList();
  }

  void init(int t, int vp, int wp) {
    v=vp;
    w=wp;

    //translate(v, w);
    x = 0;
    y =0;
    for (int k = 0; k<t; k++) {

      n = k * 2 + 1;
      radius = 2*(4 / n * PI);


      prevx = x;
      prevy = y;


      x+=  radius * cos(n*time);
      y+= radius * sin(n*time);
     

      strokeWeight(1);
      stroke(0, 100);
      noFill();
      ellipse(v+prevx, w+prevy, radius*2, radius*2);
      fill(0);
      textSize(12);
      text("n = " + t, v-100, w);
      //ellipse(x, y, 2, 2);
      strokeWeight(1.8);
      stroke(0);
      line(v+prevx, w+prevy, v+x, w+y);
    }
    strokeWeight(1);
    stroke(0);
    line(v+x, w+y, v+100, w+y);
    wave.append(y);
  }


  void display() {
    strokeWeight(1);
    translate(v+400, w+0);
    stroke(0);

    for (int i = wave.size()-1; i >1; i--) {

      beginShape();
      vertex((-i+1), wave.get(i-1));
      vertex(-i, wave.get(i));

      endShape();

      if (wave.size()>300) {
        wave.remove(1);
      }
    }
    time+=0.05;
  }
}

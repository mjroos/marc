int cols, rows;
int scl = 10;
int w =3000;
int h = 1200;
float[][] terrain;
float inc;

void setup() {
  size(1200, 600, P3D);
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
  
  
}


void draw() {
  background(0,0,255);
  frameRate(50);
  stroke(0);
  textSize(20);
  text("by Repel", 1100,20);
  
  textSize(40);
  text("Terrain generation with Perlin Noise", 200,200);
  
  inc-=.15;
  noiseDetail(3);
  float yoff = inc;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
   for (int x =0; x < cols; x++) {
     terrain[x][y]=map(noise(xoff,yoff), 0, 1, -100, 180);
     xoff+=0.02;
   }
   yoff+=.07;
  }
  
  stroke(0,255,255,50);
  //noFill();
  noStroke();
  

  translate(width/2, height/2+150);
  rotateX(PI/2.2);
  translate(-w/2, -h/2);
  
  directionalLight(203, 132, 38, 0, 1, -1);
  ambientLight(12, 85, 16, 600,600, 100);
  //fill(0, 255,255);
  
  for (int y = 0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP);

    for (int x =0; x < cols; x++) {
      //vertex(x, y);
      vertex(x * scl, y * scl, terrain[x][y]);
      vertex(x * scl, (y+1) * scl, terrain[x][y+1]);
    }
    endShape();
  }
}

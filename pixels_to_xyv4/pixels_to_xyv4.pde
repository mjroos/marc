
PImage img;
float pi, px, py, pi2;
float a =0;
ArrayList<PVector> vec;
PVector p, nul;
PrintWriter output;
float prevX=0;
float prevY=0;

import processing.pdf.*;
void setup() {
  size(600, 600);
  //size(640, 425,PDF, "kaart.pdf");
  output = createWriter("positions.txt");

  img = loadImage("kaart.png");
  vec = new ArrayList<PVector>();

  //image(img, 0, 0);
}  
void draw() {
  background(255);
  translate(width/2, height/2);
  line(0, -height, 0, height);
  line(-width, 0, width, 0);

  for (int x = 0; x< img.width; x+=1) {
    for (int y = 0; y< img.height; y+=1) {
      pi = y * img.width  + x;


      // xy from index
      px = indexToX( pi, img );
      py = indexToY( pi, img );
      // index from xy
      pi2 = xyToIndex(px, py, img);

      p = new PVector(x, y);
      nul = new PVector(0, 0);
      vec.add(p);
      p.mult(.5);

      if (img.get(x, y)>=color(0, 0, 0) && img.get(x, y)<=color(100, 0, 0)) {
        stroke(0, 0, 0);
        strokeWeight(1.2);
        ellipse(nul.x, nul.y, 10, 10);
       
        //point(p.x-width/2, p.y-height/2);
        line(p.x-1-width/2, p.y-1-height/2, p.x-width/2, p.y-height/2);
        println("{x: "+ (px) +", y: " + (py) + "}, ");
        //output.println("{x: "+ (px) +", y: " + (py) + "}, ");
        output.println(px +", " + py);
      }

      //if (img.get(x, y)>=color(100) && img.get(x, y)<=color(130)) {
      //  stroke(185, 185, 170);

      //  point(p.x-width/2, p.y-height/2);
      //  //line(p.x-1, p.y-1, p.x, p.y);
      //}
    }
  }


  noLoop();
  //exit();
}

// choose a random pixel. in P3 might use PImage.pixels[].length
float randomPixelIndex(PImage _img) {
  return (int)random(0, _img.width * _img.height);
}
// convert image xy to pixel indexp
float xyToIndex(float x, float y, PImage img) {
  return ( y * img.width ) + x;
}
// convert pixel index to image x
float indexToX(float i, PImage img) {
  return ( i % img.width );
}
// convert pixel index to image y
float indexToY(float i, PImage img) {
  return ( i / img.width );
}
// could replace indexToX and indexToY
// with one function returning an int[]


void keyPressed() { // Press a key to save the data
  output.flush(); // Write the remaining data
  output.close(); // Finish the file
  exit(); // Stop the program
}

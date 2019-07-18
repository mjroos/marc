PImage img;
PrintWriter output;
ArrayList<PVector> vec;
PVector p, nul;
IntList D;
int px, py;
float a =0;
float s =0.5;
import processing.pdf.*;

void keyPressed() { // Press a key to save the data
  output.flush(); // Write the remaining data
  output.close(); // Finish the file
  exit(); // Stop the program
}

void setup() {
  //background(255);
  //size(500, 500, PDF, "lijn.pdf");
  size(640, 600);
  vec = new ArrayList<PVector>();
  output = createWriter("positions.txt");
  D = new IntList();
  img=loadImage("Wasp.jpg");
  image(img, 70, 50);
}

void draw() {
  background(255);
  smooth();
  stroke(255,0,0);
  fill(0);
  textSize(20);
  text("Pixels to XY-Coördinates", 20,30);
  noFill();
  translate(width/2, height/2);
  //line(0, -height, 0, height);
 // line(-width, 0, width, 0);




   delay(3000);

  for (int x =0; x < img.width; x++) {
    for (int y =0; y<img.height; y++) {
      if (img.get(x, y)>=color(0) && img.get(x, y)<=color(210) ) {

        int index = x+img.width*y;
        D.append(index);

        py = index /img.width;
        px = index % img.width;

        p = new PVector(x, y);
        //nul = new PVector(-67, -40);
         nul = new PVector(40,30);
        //ellipse(nul.x,nul.y,50,50);
       PVector k=PVector.sub(p,nul);
        
        k.mult(1.5);

        stroke(0);
        //strokeWeight(1);
        //point(p.x-(width/2), p.y-(height/2));
       
        point(k.x-(width/2), k.y-(height/2));
       
      }
    }
    }
    
     for (int i = 1; i < vec.size(); i++) {
       
       PVector v = vec.get(i);
       
       
      //point(v.x-(width/2),v.y-(height/2));
     //   println(v.x-width/2,v.y-height/2);
     //println(v);
      }
       
  

  //delay(2000);
  //for (int i = 1; i < D.size(); i++) {
  //  //rotate(a);
  //  int dx = D.get(i) % img.width;
  //  int dy = D.get(i) / img.width;

  //  stroke(0);

  //  fill(random(255),random(255),random(255));
  //  point(dx-width/2, dy-height/2);
  //  rect(dx-width/2, dy-height/2, 35, 35);
  //  line(dx-1-width/2, dy-1-height/2, dx-width/2, dy-height/2);
  //  output.println("{x: "+ (dx) +", y: " + (dy) + "}, ");
  //  output.println(dx +"," + dy);
  //  println(dx, dy);
  //}


  //noLoop();

  //exit();
}

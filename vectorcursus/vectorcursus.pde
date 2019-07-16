PVector p1, p1a, p2, p3, p3a, p4;
float a=0;
String s1 = "startlocation";
String s2 = "endlocation";
String s3 = "direction";
String s4 = "traveler";
String  s5= " ";
boolean running = true;
float L;

void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  stroke(0);
  line(-width/2, 0, width/2, 0);
  line(0, -height/2, 0, height/2);

  show();

  if (running) {
    s2 = "endlocation";

    a+=.5;

    if (a <= L) {
      s5=" ";
      running = true;
    } else if (a >= L) {
      s2=" ";
      s5 = "The traveler has reached his destination";
      running = false;
    }
  }
}

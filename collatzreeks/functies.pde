
//Function divide over 2, Step 1
float stap1(float a, int m) {
  float b = a/m;
  return b;
}

//Function multiply by 3 and count 1
float stap2(float a, int m) {
  float b = (a*m)+1;
  return b;
}

//Function check if the factor is even
boolean check(float a) {
  if (a % 2 == 0) {
    c = true;
  } else {
    c = false;
  }
  return c;
}

//Function generate list with te Collatz elements
void collatzList() {
  output.println("Collatz Iteration");
  output.println("Initial number: " + getal);
  output.println("https://github.com/mjroos/marc/tree/master/collatzreeks");
  output.println("--------------------------");
  for ( int i = 0; i < collatz.size(); i++) {
    output.println("List " + i + ": " + collatz.get(i));
    println("List " + i + ": " + collatz.get(i));
  }
}

//Function Graph
void graph() {
  for ( int i = 0; i < collatz.size(); i++) {
    float x0 = i;
    float y0 = collatz.get(i);
    x = map(x0, 0, 25*xzoom, 50, width);
    y = map(y0, 0, 100*yzoom, height-50, 250);
    xt =map(x0-1, 0, 25*xzoom, 50, width);

    stroke(255, 0, 0);
    strokeWeight(4);
    point(x, y);
    beginShape();
    stroke(255, 255, 255, 200);
    strokeWeight(1);
    vertex(xt, yt);
    vertex(x, y);
    endShape();
    xt = x;
    yt=y;
    textSize(12);
    textAlign(CENTER, BOTTOM);
    fill(255);
    text(int(y0), x, y);
  }
}

//Function for tect
void texting() {
  textAlign(LEFT);
  textSize(20);
  fill(255);
  text("Collatz Iteration", 70, 50);
  text("Initial number" + " : " + getal, 70, 80);
  textSize(15);
  text("https://github.com/mjroos/marc/tree/master/collatzreeks", 70, 100);
}
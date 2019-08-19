//The presumption of Collatz is a presumption in number theory that says 
//that a certain iteration leads in all cases to the number 1, whichever 
//number "n" is chosen as the starting value.

//https://github.com/mjroos/marc/tree/master/collatzreeks
//M.Roos, 19 aug. 2019

float getal = 50;      //by initial number 5, xzoom = 5, yzoom = 300000

void setup() {
  size(600, 600);
   output = createWriter("positions.txt");
  collatz = new FloatList();
  float n = stap1(getal, 2);
  collatz.append(getal);

  while (n!=1) {
    if (check(n)==false) {
      n =  stap2(n, 3);
      collatz.append(n);
    } else {
      n = stap1(n, 2);
      collatz.append(n);
    }
  }
  if (n==1) {
    println("found 1");
  }
  collatzList();
}

void draw() {
  background(53);
  graph();
  texting();
  save("grafiek5.jpg");
  noLoop();
}


void keyPressed() { // Press a key to save the data
  output.flush(); // Write the remaining data
  output.close(); // Finish the file
  exit(); // Stop the program
}
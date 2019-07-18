// The Nature of Code
// Marc Roos
// http://natureofcode.com

// Recursive Tree
// Renders a simple tree-like structure via recursion


float theta;   
float i=0;

void setup() {
  size(640, 500);
}

void draw() {
  background(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position

  theta = map(i,0,width,0,PI/2);

  // Start the tree from the bottom of the screen
  translate(width/2, height);
 
      stroke(0);
       branch(150);
  
  if (i<200){
 i=i+.5;
 
 println(i);
  }
}

void branch(float len) {
  // Each branch will be 2/3rds the size of the previous one
  float sw = map(len,2,120,1,20);
  strokeWeight(sw);
      
  line(0, 0, 0, -len);
  // Move to the end of that line
  translate(0, -len);

  len *= 0.66;
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (len > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
     rotate(theta);   // Rotate by theta
        branch(len);       // Ok, now call myself to draw two new branches!!
    
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state

    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    branch(len);
    popMatrix();
  }
}
class Planeet {
  
  PShape planet1;
color c;
float subx;
float suby;
float suba;
float subb;
float z=1;
float q = .4;
float f;
float theta_vel;
float theta;
float t_theta=theta_vel;



Planeet(color kleur, float px, float py, float apogeum, float perigeum, float brandpunt, float speed) {
 
c = kleur;
subx = px*z;
suby=py*z;
suba=(apogeum/2)*z*q;
subb=(perigeum/2*z*q);
f = brandpunt;
theta_vel = speed;

planet1 = createShape(SPHERE, suba);
  planet1.setTexture(img);
}

void coor(String Naam){
  

  
fill(c);
noStroke();  
//float x = ((subx)) * cos(theta);
    //x =x+f;
 //float y = ((suby)) * sin(theta);
 

 /*
 if(plattegrond){
 text(Naam,x+suba,y);
 }
 */
       //noStroke();
       
pushMatrix();
//translate(x, y, 0);
//sphereDetail(24);
//sphere(suba);

shape(planet1);
 
//ellipse(x, y, suba, subb); //eclipsbaan planeet en omtrek planeet
       theta += theta_vel;
  popMatrix();     

}

}
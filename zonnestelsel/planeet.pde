class Planeet {
color c;
float subx;
float suby;
float suba;
float subb;
float z=.4;
float f;
float theta_vel;
float theta;

Planeet(color kleur, float px, float py, float apogeum, float perigeum, float brandpunt, float speed) {
 
c = kleur;
subx = px*z;
suby=py*z;
suba=(apogeum/2)*z;
subb=(perigeum/2*z);
f = brandpunt;
theta_vel = speed;

}

void coor(){
      
fill(c);
      
float x = ((subx)) * cos(theta);
    x =x+f;
 float y = ((suby)) * sin(theta);
       ellipse(x, y, suba, subb); //eclipsbaan planeet en omtrek planeet
       theta += theta_vel;

}

void tekst(String naam) {
float x = ((subx)*z) * cos(theta);
  x =x+f;

  float y = ((suby)*z) * sin(theta);
        
    textSize(15);
    fill(0, 102, 153);
    text(naam, (x+suba), (y+subb));

      theta += theta_vel;
}

}
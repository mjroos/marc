class Planeet {
color c;
float subx;
float suby;
float suba;
float subb;
float z=1;
float f;
float theta_vel;
float theta;
float t_theta=theta_vel;


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
  
float tx = ((subx)) * cos(t_theta);
  tx =tx+f+suba*z;

  float ty = ((suby)) * sin(t_theta);
        ty=ty+subb*z;
    textSize(12);
    fill(0, 102, 153);
    //text(naam, (tx+suba*z), (ty+subb*z));
text(naam, (tx), (ty));
     t_theta += theta_vel;
}

}
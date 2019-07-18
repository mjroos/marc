class Moon {
color c;
float subx;
float suby;
float suba;
float subb;
float z=.4;
float f;
float s;
float theta_vel;
float theta;

float thetamoon_vel;
float thetamoon;


Moon(color kleur, float px, float py, float apogeum, float perigeum, float brandpunt, float speed, float mspeed, float afstand) {
 
c = kleur;
subx = px;
suby=py;
suba=(apogeum/2)*z;
subb=(perigeum/2*z);
f = brandpunt;
s = afstand;
theta_vel = speed;
thetamoon_vel=mspeed;

}

void mcoor(){
      
fill(c);
      
float x = ((subx)*z) * cos(theta);
    x =x+f;
 float y = ((suby)*z) * sin(theta);
 y = y ;
 
 theta+= theta_vel;
 
 float mx = (suba+s)*cos(thetamoon);
 float my = (subb+s)*sin(thetamoon);
 mx = x +mx;
 my = y+my;
 
       ellipse(mx, my, suba, subb); //eclipsbaan planeet en omtrek planeet
       thetamoon += thetamoon_vel;
       
       

}
/*
void tekst(String naam) {
float x = ((subx)*z) * cos(theta);
  x =x+2.5;

  float y = ((suby)*z) * sin(theta);
        
    textSize(15);
    fill(0, 102, 153);
    text(naam, (x+suba), (y+subb));

      theta += theta_vel;
}
*/
}
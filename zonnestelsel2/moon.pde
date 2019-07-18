class Moon {
color c;
float subx;
float suby;
float suba;
float subb;
float z=1;
float f;
float s;
float theta_vel;
float theta;
float thetamoon;
float thetamoon_vel;
float k_theta=theta_vel;


Moon(color kleur, float px, float py, float apogeum, float perigeum, float brandpunt, float speed, float mspeed, float afstand) {
 
c = kleur;
subx = px*z;
suby=py*z;
suba=(apogeum/2)*z;
subb=(perigeum/2)*z;
f = brandpunt;
s = afstand*z;
theta_vel = speed;
thetamoon_vel=mspeed;

}

void mcoor(){
      
fill(c);
      
float x = ((subx)) * cos(theta);
    x =x+f;
 float y = ((suby)) * sin(theta);
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
  x =x+f+subx;

  float y = ((suby)*z) * sin(theta);
        y=y+suby;
      theta += theta_vel;  
        
       float kx = (suba+s)*cos(thetamoon);
 float ky = (subb+s)*sin(thetamoon);
 kx = x +kx;
 ky = y+ky; 
        
        
        
        
    textSize(10);
    fill(0, 102, 153);
    text(naam, (kx+suba*z), (ky+subb*z));

      k_theta += theta_vel;
}
*/
}
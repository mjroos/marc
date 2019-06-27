Sin s1, s2, s3, s4, s5, s6, s7, s8;

void setup() {
  size(600, 600);
  //wave = new FloatList();
  s1=new Sin();
  s2=new Sin();
  s3=new Sin();
  s4=new Sin();
  s5=new Sin();
  s6=new Sin();
  s7=new Sin();
  s8=new Sin();
}

void draw() {
  background(255);
  textSize(15);
  text("Fourier series", 20, 20);

  s1.init(1, 120, 75);
  s1.display();

  s2.init(2, -400, 65);
  s2.display();

  s3.init(3, -400, 65);
  s3.display();

  s4.init(5, -400, 65);
  s4.display();

  s5.init(10, -400, 65);
  s5.display();

  s6.init(20, -400, 65);
  s6.display();
  
  s7.init(40, -400, 65);
  s7.display();
  
  s8.init(140, -400, 65);
  s8.display();
}

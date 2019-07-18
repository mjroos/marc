
import ddf.minim.*;


Minim mySine;
AudioPlayer myMusic;
AudioMetaData meta;



int ys = 25;
int yi = 15;


void setup()
{
  size(1024, 200);

  mySine = new Minim(this);
  myMusic = mySine.loadFile("4.mp3", 1024);
  //meta = myMusic.getMetaData();

  myMusic.loop();

}


void draw()
{

  background(0);

    stroke( 255 );

    // draw the waveforms
    // the values returned by left.get() and right.get() will be between -1 and 1,
    // so we need to scale them up to see the waveform
    // note that if the file is MONO, left.get() and right.get() will return the same value

    for (int i = 0; i < myMusic.bufferSize() - 1; i++)
    { 
      float x1 = map( i, 0, myMusic.bufferSize(), 0, width );
      float x2 = map( i+1, 0, myMusic.bufferSize(), 0, width );
       stroke(167, 165, 154);
      strokeWeight(2);
      line( x1, 50 + myMusic.left.get(i)*50, x2, 50 + myMusic.left.get(i+1)*50 );
      line( x1, 150 +myMusic.right.get(i)*50, x2, 150 + myMusic.right.get(i+1)*50 );
      pushMatrix();
      translate(0, 50);
      //fill(247, 12, 12);
      //ellipse(x1, myMusic.left.get(i)*50, 5, 5);

      popMatrix();
      strokeWeight(1);
    }
    float x = map(myMusic.position(), 0, myMusic.length(), 0, width);
    stroke(255, 0, 0);

    line(x, 200, x, 0);
    


    stroke(39, 180, 18);
    fill( 39, 180, 18, myMusic.left.level()*width);

    // the value returned by the level method is the RMS (root-mean-square)
    // value of the current buffer of audio.
    // see: http://en.wikipedia.org/wiki/Root_mean_square
    rect( 0, 25, myMusic.left.level()*width, 50 );
    rect( 0, 120, myMusic.right.level()*width, 50 );

}
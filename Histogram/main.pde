import processing.video.*;

Movie m;
boolean play;
histogram h;
PImage img;

void setup(){
  frameRate(30);
  size(1280,720);
  m = new Movie(this, "movie.mp4");
  
  img = loadImage("epic.png");
  img.loadPixels();
  
  h = new histogram();
  
  noLoop();
}

void draw(){
  if(play && m.available()){
    m.read();
  }
  
  background(255);
  
  image(m,0,0);
  
  h.draw(0,720,200,m);
}

void keyPressed(){
  if(key == 'p'){
    play = !play;
  }
}

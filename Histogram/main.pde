//import processing.video.*;

//Movie m;
boolean play;
histogram h;
PImage img;

void setup(){
  frameRate(30);
  size(575,575);
  //m = new Movie(this, "movie.mp4");
  
  img = loadImage("epic.png");
  img.loadPixels();
  
  h = new histogram();
  
  noLoop();
}

void draw(){
  /*if(play && m.available()){
    m.read();
  }*/
  
  background(255);
  
  //image(img,0,0);
  
  h.draw(50,500,200,img);
}

void keyPressed(){
  if(key == 'p'){
    play = !play;
  }
}

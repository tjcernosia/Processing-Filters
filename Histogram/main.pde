int data[];
histogram h;
PImage img;

void setup(){
  size(256,400);
  
  img = loadImage("img.JPG");
  img.loadPixels();
  data = new int[256];
  
  for(int i = 0; i < data.length; i++){
    data[i] = (int)random(256);
  }
  
  h = new histogram();
  
  noLoop();
}

void draw(){
  
  background(255);
  
  h.draw(0,400,200,img);
}

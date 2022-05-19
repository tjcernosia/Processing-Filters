int data[];
histogram h;
PImage img;

void setup(){
  size(575,575);
  
  img = loadImage("epic.png");
  img.loadPixels();
  data = new int[256];
  
  for(int i = 0; i < data.length; i++){
    data[i] = (int)random(256);
  }
  
  h = new histogram();
  h.drawAxis = true;
  
  noLoop();
}

void draw(){
  
  //image(img,0,0);
  
  h.draw(500-255,500,200,img);
}

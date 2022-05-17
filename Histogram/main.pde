float data[];
histogram h;
PImage img;

void setup(){
  size(256,256);
  
  img = loadImage("img.JPG");
  img.loadPixels();
  data = new float[256];
  
  for(int i = 0; i < data.length; i++){
    data[i] = random(256);
  }
  
  noLoop();
}

void draw(){
  
  background(255);
  
  h.draw(0,255,256);
}

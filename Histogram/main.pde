

int data[];
histogram h;
PImage img,img2;

void setup(){
  size(720,720);
  
  img = loadImage("epic.png");
  img2 = loadImage("img.JPG");
  data = new int[2000];
  
  for(int i = 0; i < data.length; i++){
    data[i] = (int)random(200);
  }
  
  h = new histogram();
  h.drawAxis = true;
  
  noLoop();
}

void draw(){
  background(150,200);
  for(int i = 0; i < data.length; i++){
    int r = (int)random(2);
    if(r == 1) data[i] += 1;
    else data[i] -= 1;
  }
  //image(img,0,0);
  
  h.draw(700-255,500,200,img);
}

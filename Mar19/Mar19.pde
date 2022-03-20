PGraphics pg; 

PImage image;
int aWidth;
int aHeight;

//adjust these
int tileSize = 4;
int threshold = 120;

void setup(){
  noLoop();
  image = loadImage("image.jpg");
  aWidth = image.width/tileSize;
  aHeight = image.height/tileSize;
  pg = createGraphics(aWidth,aHeight);
  size(500,500);
}

void draw(){
  pg.beginDraw();
  pg.fill(color(255));
  pg.rect(0,0,aWidth,aHeight);
  pg.fill(color(0));
  
  for(int i = 0; i < aWidth; i++){
    for(int j = 0; j < aHeight; j++){
      
      float brightness = average(i * tileSize,j * tileSize);
      
      if(brightness > threshold){
        pg.point(i,j);
      }
      
    }
  }
  
  pg.endDraw();
  image(pg,0,0);
}

float average(int x, int y){
  float sum = 0; 
  
  PImage current = image.get(x,y,tileSize,tileSize);
  current.loadPixels();
  
  for(int i = 0; i < tileSize * tileSize; i++){
    color c = current.pixels[i];
    sum += brightness(c);
  }
  
  return sum/(tileSize * tileSize);
}

void keyPressed(){
  pg.save("output.jpg");
  print("image saved");
  exit();
}

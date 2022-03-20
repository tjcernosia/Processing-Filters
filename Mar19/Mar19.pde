PGraphics pg; 

int tileSize = 4;
PImage image;
int aWidth;
int aHeight;

void setup(){
  noLoop();
  image = loadImage("image.png");
  aWidth = image.width/tileSize;
  aHeight = image.height/tileSize;
  pg = createGraphics(aWidth,aHeight);
}

void draw(){
  print("tileSize: " + tileSize + "\n");
  print("Image w/h: " + image.width + " " + image.height + "\n");
  print("Adjusted w/h: " + aWidth + " " + aHeight + "\n");
  
  pg.beginDraw();
  pg.fill(color(0,0,255));
  pg.rect(0,0,100,100);
  pg.endDraw();
  image(pg,0,0);
}

float average(int x, int y){
  PImage current = image.get(x,y,tileSize,tileSize);
  current.loadPixels();
  
  return 1;
}

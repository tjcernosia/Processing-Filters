PGraphics pg; 

int tileSize = 1;
PImage image;

void setup(){
  size(200,200);
  pg = createGraphics(100,100);
}

void draw(){
  pg.beginDraw();
  pg.fill(color(0,0,255));
  pg.rect(0,0,100,100);
  pg.endDraw();
  image(pg,50,50);
}

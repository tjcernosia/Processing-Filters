abstract class shape{
  
  //number of times findImg will check an image for matching section
  final int maxFindAttempt = 100;
  //no matter shape defined as as upper left most point of shape
  float x,y;
  //contains corresponding shape masked image data 
  PImage img;
  PImage mask;
  
  public shape(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  abstract void imgFind(float tolerance);
  abstract void draw();
  abstract boolean intersect(float x, float y);
}

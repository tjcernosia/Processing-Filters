public class circle{
  
  float x,y,radius;
  float xAccel, yAccel;
  float xVelo, yVelo;
  color fillColor;
  
  public circle(float x, float y, float radius){
    this.x = x;
    this.y = y;
    this.radius = radius;
    fillColor = color(random(255), random(255), random(255));
  }
  
  public circle(float x, float y, float radius, color fillColor){
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.fillColor = fillColor;
  }
  
  void update(){
    float t = 1/fps;
    
    float xDist = xVelo * t + (xAccel * t * t)/2;
    float yDist = yVelo * t + (yAccel * t * t)/2;
    
    xVelo += t * xAccel;
    yVelo += t * yAccel;
    
    x += xDist;
    y += yDist;
  }
  
}

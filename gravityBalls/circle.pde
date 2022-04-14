public class circle{
  
  float x,y,radius;
  float xAccel, yAccel;
  float xVelo, yVelo;
  color fillColor;
  
  public circle(){
    
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

public class circle{
  public float x,y,radius;
  float xAccel, yAccel;
  public color fillColor;
  
  public circle(){
    
  }
  
  void drawCircle(){
    fill(fillColor);
    circle(x,y,radius);
  }
  
}

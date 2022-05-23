public class circle{
  float maxRadius = 10;
  float x,y,radius;
  
  public circle(float x,float y){
    this.x = x;
    this.y = y;
    radius = 0;
  }
  
  void incrementRadius(){
    radius += .01;
  }
  
  boolean intersect(circle c){
    
    if(this == c) return false;
    
    double a = Math.pow(x-c.x,2);
    double b = Math.pow(y-c.y,2);
    double dist = Math.sqrt(a + b);
    
    if(dist < radius + c.radius) return true;
    else return false;
    
  }
  
  void draw(){
    circle(x,y,radius);
  }
  
}

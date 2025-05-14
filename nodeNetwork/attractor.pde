class attractor{
  float x=0, y = 0;
  float radius = 500;
  
  attractor(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void attract(Iterable<node> nodes){
    for(node n: nodes){
      attract(n);
    }
  }
  
  void attract(node n){
    float dx = x - n.x;
    float dy = y - n.y;
    float d = mag(dx,dy);
    
    if(d > 0 && d < radius){
      float s = d/radius;
      float f = 1/pow(s,.5)-1;
      f = f/radius;
      
      n.velocity.x += dx * f;
      n.velocity.y += dy * f;
    }
  }
  
  //**SETTERS**//
  void setRadius(float r){
    radius = r;
  }
  
}

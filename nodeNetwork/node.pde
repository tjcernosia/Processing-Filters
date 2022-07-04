class node extends PVector {

  PVector velocity = new PVector();
  float minX = 30, minY = 30, maxX = width - 30, maxY = height - 30;
  float damping = .1;
  int connections = 0;
  float radius = 0;
  float strength = -5;

  public node(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void drawNode() {
    noStroke();
    fill(255-map(connections, 0, 10, 0, 255));
    circle(x,y,5);
  }
  
  void update() {
    x += velocity.x;
    y += velocity.y;
    
    /*if(x < minX){
      x = minX;
      velocity.x = -velocity.x;
    }
    if(x > maxX){
      x = maxX;
      velocity.x = -velocity.x;
    }
    if(y < minY){
      y = minY;
      velocity.y = -velocity.y;
    }
    if(y > maxY){
      y = maxY;
      velocity.y = -velocity.y;
    }*/
    
    velocity.x *= (1-damping);
    velocity.y *= (1-damping);
  }
  
  void attract(Iterable<node> nodes){
    for(node n: nodes){
      if(n == null) break;
      if(n == this) continue;
      
      attract(n);
    }
  }
  
  void attract(node n){
    float d = PVector.dist(this, n);
    
    if(d > 0 && d < radius){
      float s = pow(d/radius, 1/.5);
      float f = s * 9 * strength * (1/(s+1) + ((s-3)/4)) / d; 
      
      PVector df = PVector.sub(this,n);
      df.mult(f);
      
      n.velocity.x += df.x;
      n.velocity.y += df.y;
    }
  }
  
  
}

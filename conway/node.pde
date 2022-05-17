class node{
  
  float x,y;
  float xDim,yDim;
  float step;
  pixel pixels[][] = new pixel[3][3];
  boolean on;
  
  public node(float x, float y, float dim){
    on = false;
    this.x = x;
    this.y = y;
    xDim = dim;
    yDim = dim;
    step = dim/3;
    
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        pixels[i][j] = new pixel();
      }
    }
    
  }
  
  void update(){
    if(on) on = !on;
  }
  
  void update(node n){
    pixels = n.pixels;
  }
  
  void draw(){
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        pixel current = pixels[i][j];
        float xpos = x + i*step;
        float ypos = y + j*step;
        current.update();
        if(on)
        { 
          for(int k = 0; k < 3; k++){
            for(int l = 0; l < 3; l++){
              fill(pixels[k][l].fill);
              println("x");
              rect(x + step * k, y + step * y, step, step);
            }
          }
        }
        else {
          fill(color(0));
          rect(xpos,ypos,step,step);
        }
      }
    }
  }
  
  node clone(node n){
    node newNode = new node(n.x,n.y,n.step);
    pixel p = new pixel();
    
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        newNode.pixels[i][j] = p.clone(n.pixels[i][j]);
      }
    }
    
    return newNode;
  }
  
  boolean equals(Object o){
    if(o == this) return true;
    if(!(o instanceof node)) return false;
    node n = (node)o;
    
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        if(pixels[i][j].isOn != n.pixels[i][j].isOn) return false;
      }
    }
    
    return true;
  }
}

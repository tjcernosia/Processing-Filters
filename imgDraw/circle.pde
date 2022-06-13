class circle extends shape {
  
  float radius;
  
  public circle(float x, float y, float radius){
    super(x,y);
    this.radius = radius;
  }
  
  void imgFind(float tolerance, ArrayList<PImage> images){
    for(int i = 0; i < images.size(); i++){
      for(int j = 0; j < maxFindAttempt; j++){
        PImage current = images.get(i);
        int x = (int)random(current.width - 2 * radius);
        int y = (int)random(current.height - 2 * radius);
        
        PImage masterSection = master.get(x,y,(int)radius * 2, (int)radius * 2);
        float brightness = getBrightness(masterSection);
        
      }
    }
  }
  
  
  
  boolean intersect(float x, float y){
    return false;
  }
  
  void draw(){}
}

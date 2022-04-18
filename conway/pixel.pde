class pixel{

  color fill; 
  boolean isOn;
  
  public pixel(){
    fill = color(0); 
    isOn = false;
  }
  
  void update(){
    
  }
  
  pixel clone(pixel p){
    pixel newPixel = new pixel();
    newPixel.fill = p.fill;
    newPixel.isOn = p.isOn;
    
    return newPixel;
  }
  
}

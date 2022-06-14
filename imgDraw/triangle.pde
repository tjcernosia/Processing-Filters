class triangle extends shape{
  
  public triangle(float x, float y, float extent){
    super(x,y,extent);
  }
  
  void generateMask(){
    PGraphics m = createGraphics((int)extent, (int)extent);
    m.beginDraw();
    m.noStroke();
    m.background(0);
    m.fill(255);
    
    switch((int)random(4)){
      case(0):
        m.triangle(extent,0,extent,extent,0,extent);
        break;
      case(1):
        m.triangle(0,0,extent,extent,0,extent);
        break;
      case(2):
        m.triangle(0,0,0,extent,extent,0);
        break;
      case(3):
        m.triangle(0,0,extent,0,extent,extent);
        break;
    }
    
    m.endDraw();
    mask = m.get();
  }
}

abstract class shape{
  
  //number of times findImg will check an image for matching section
  final int maxFindAttempt = 50;
  //no matter shape defined as as upper left most point of shape
  float x,y,extent;
  //contains corresponding shape masked image data 
  PImage img;
  PImage mask;
  
  public shape(float x, float y, float extent){
    this.x = x;
    this.y = y;
    this.extent = extent;
    generateMask();
    imgFind(2);
    draw();
    //can use to generate procedural demonstration
    println("STEP " + (++framecount) + " COMPLETE"); 
    //canvas.save("frames/frame" + ".jpg");
  }
  
  void imgFind(float tolerance){
    PImage masterSection = master.get((int)x, (int)y, (int)extent, (int)extent);
    
    for (int i = 0; i < images.size(); i++) {
      for (int j = 0; j < maxFindAttempt; j++) {
        PImage current = images.get(i);
        int rx = (int)random(current.width - extent);
        int ry = (int)random(current.height - extent);
        current = current.get(rx,ry,(int)extent,(int)extent);
        
        float diff = getDiff(current, masterSection);
        if(checkDiff(current, masterSection, tolerance)){
          println("FOUND (tolerance: " + tolerance + ") (diff^2: " + diff +")");
          //println("current brightness: " + getBrightness(current));
          //println("master brightness: " + masterBrightness);
          img = current;
          img.mask(mask);
          return;
        }
      }
    }
    println("Match not found, increasing tolerance to: " + tolerance);
    imgFind(tolerance + 1);
  }
  
  void draw() {
    canvas.beginDraw();
    canvas.image(img,x*scale,y*scale);
    canvas.endDraw();
  }
  
  abstract void generateMask();
}

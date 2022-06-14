class circle extends shape {

  float extent;

  public circle(float x, float y, float extent) {
    super(x, y);
    this.extent = extent;
    generateMask();
    imgFind(2);
    draw();
  }

  void imgFind(float tolerance) {

    PImage masterSection = master.get((int)x, (int)y, (int)extent, (int)extent);
    float masterBrightness = getBrightness(masterSection);    
    
    for (int i = 0; i < images.size(); i++) {
      for (int j = 0; j < maxFindAttempt; j++) {
        PImage current = images.get(i);
        int rx = (int)random(current.width - extent);
        int ry = (int)random(current.height - extent);
        current = current.get(rx,ry,(int)extent,(int)extent);
        
        if(sqrt(pow(getBrightness(current) - masterBrightness, 2)) < tolerance){
          println("FOUND (tolerance: " + tolerance + ") (diff^2: " + sqrt(pow(getBrightness(current) - masterBrightness, 2))+")");
          println("current brightness: " + getBrightness(current));
          println("master brightness: " + masterBrightness);
          img = current;
          img.filter(GRAY);
          img.mask(mask);
          return;
        }
      }
    }
    
    println("match not found, tolerance increased to: " + (tolerance + 1));
    imgFind(tolerance + 1);
  }

  void generateMask() {
    PGraphics m = createGraphics((int)extent, (int)extent);
    m.beginDraw();
    m.ellipseMode(CORNER);
    m.noStroke();
    m.background(0);
    m.fill(255);
    m.circle(0, 0, extent);
    m.endDraw();

    mask = m.get();
  }

  boolean intersect(float x, float y) {
    return false;
  }

  void draw() {
    canvas.beginDraw();
    canvas.tint(getTint(img));
    canvas.image(img,x*scale,y*scale);
    canvas.tint(255);
    canvas.endDraw();
  }
}

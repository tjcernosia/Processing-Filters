class square extends shape {


  public square(float x, float y, float extent) {
    super(x, y, extent);
  }

  void generateMask() {
    PGraphics m = createGraphics((int)extent, (int)extent);
    m.beginDraw();
    m.background(255);
    m.endDraw();
    mask = m.get();
  }
}

class circle extends shape {

  public circle(float x, float y, float extent) {
    super(x, y, extent);
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
}

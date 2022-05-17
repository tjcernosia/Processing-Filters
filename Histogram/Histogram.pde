public class histogram {

  static final int HIST_IMG = 0;
  static final int HIST_DATA = 1;

  PImage img;
  int[] data;
  int[] cols;
  float bucket;
  float colsize;
  
  public histogram(){
    
  }

  public histogram(int range) {
    bucket = 1;
    colsize = 1;
    cols = new int[range];
  }

  public histogram(int range, int[] data) {
    this.data = data;
    bucket = 1;
    colsize = 1;
    cols = new int[range];
  }

  public histogram(PImage img) {
    img.loadPixels();
    data = img.pixels;
    cols = new int[256];
  }

  void updateData(int[] d) {
    data = d;
  }

  void makeCols() {
    for (int i = 0; i < data.length; i++) {
      cols[(int)data[i]] += 1;
      println(i + ": " + data[i]);
    }
  }

  //draw hist with instance variables
  void draw(float x, float y, float height) {
    println("( " + x + ", " + y + ")");
    makeCols();
    float max = max(cols);

    stroke(15);

    for (int i = 0; i < cols.length; i++) {
      float colHeight = map(cols[i], 0, max, 0, height);
      line(x+i, y, x+i, y-colHeight);
    }
  }
  
  //draw data
  void draw(float x, float y, float height, int[] data) {
    println("( " + x + ", " + y + ")");
    makeCols();
    float max = max(cols);

    stroke(15);

    for (int i = 0; i < cols.length; i++) {
      float colHeight = map(cols[i], 0, max, 0, height);
      line(x+i, y, x+i, y-colHeight);
    }
  }
  
  void draw(float x, float y, float height, PImage img) {
    println("( " + x + ", " + y + ")");
    makeCols();
    float max = max(cols);

    stroke(15,240);

    for (int i = 0; i < cols.length; i++) {
      float colHeight = map(cols[i], 0, max, 0, height);
      line(x+i, y, x+i, y-colHeight);
      point(x+i,y-colHeight);
    }
  }
}

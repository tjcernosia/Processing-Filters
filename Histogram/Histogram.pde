//***TODO***//
//Support negative numbers

public class histogram {

  PImage img;
  ArrayList<int[]> data;
  ArrayList<int[]> cols;
  color[] channelColors = new color[256];
  int range;
  int minValue;
  float bucket;
  float colsize;
  
  boolean drawAxis;
  boolean drawLabels;
  
  //****------------Constructors------------****//
  
  public histogram(){
    bucket = 1;
    colsize = 1;
    data = new ArrayList<int[]>();
    cols = new ArrayList<int[]>();
  }

  public histogram(int range) {
    this();
    cols.add(new int[range]);
  }

  public histogram(int range, int[] d) {
    this();
    data.add(d);
    cols.add(new int[range]);
  }

  public histogram(PImage img) {
    this();
    initImage(img);
  }
  
 //****------------Getters/Setters------------****//

  void addChannel(int[] d){
    data.add(d);  
    cols.add(new int[range]);
  }
  
  void addChannel(int[] d, int r){
    if(r < range){
      throw new IllegalArgumentException("Invalid range: " + r);
    }
    
    range = r;
    data.add(d);  
    cols.add(new int[range]);
  }
  
  void setChannelColor(int idx, color c){
    if(idx < 0 || idx >= data.size()) throw new IllegalArgumentException("Invalid channel idx: " + idx);  
    channelColors[idx] = c;
  }

 //****------------Draw functions------------****//

  //draw hist with instance variables
  void draw(float x, float y, float height) {
    drawHelper(x,y,height);
  }
  
  //draw data
  void draw(float x, float y, float height, int range, int[] d) {
    clearChannels();
    this.range = range;
    data.add(d);
    cols.add(new int[range]);
    drawHelper(x,y,height);
  }
  
  //draw img
  void draw(float x, float y, float height, PImage img) {
    clearChannels();
    initImage(img);
    drawHelper(x,y,height);
  }
  
 //****------------Helper Functions------------****//
  
  private void drawHelper(float x,float y,float height){
    
    //determine max/min value in all channels
    float max = 0;
    
    for(int i = 0; i < cols.size();i++){
      int[] current = cols.get(i);
      println(current[0]);
      float currentMax = max(current);
      if(currentMax > max)
        max = currentMax;
    }
    
    //init columns
    makeCols();
    
    if(drawAxis){
      line(x-1,y,x-1,y-height);
      line(x-1,y+1,x+256,y+1);
    }
    
    //draw each channel
    for(int i = cols.size() - 1; i >= 0; i--){
      int[] current = cols.get(i);
      for(int j = 0; j < current.length; j++){
        float colHeight = map(current[j],0,max,0,height);
        stroke(100,150);
        line(x+j, y, x+j, y-colHeight);
      }
    }
    
    //draw lines on top of channels
    noFill();
    for(int i = cols.size() - 1; i >= 0; i--){
      int[] current = cols.get(i);
      stroke(0);
      beginShape();
      for(int j = 0; j < current.length; j++){
        float colHeight = map(current[j],0,max,0,height);
        curveVertex(x+j, y - colHeight);
      }
      endShape();
    }
  }
  
  //count data 
  private void makeCols() {
    for(int i = 0; i < data.size(); i++){
      
      int[] currentData = data.get(i);
      int[] currentCols = cols.get(i);
      
      for(int j = 0; j < currentData.length; j++){
        
        currentCols[currentData[j]] += 1;
        
      }
    }
  }
  
  private void initImage(PImage img){
    minValue = 0;
    range = 256;
    img.loadPixels();
    int len = img.pixels.length;
    //one array each for brightness and r,g,b channels 
    for(int i = 0; i < 4; i++){
      data.add(new int[len]);
      cols.add(new int[range]);
    }
    
    //copy values into data
    for(int i = 0; i < len; i++){
      data.get(0)[i] = (int)brightness(img.pixels[i]);
      data.get(1)[i] = (int)red(img.pixels[i]);
      data.get(2)[i] = (int)green(img.pixels[i]);
      data.get(3)[i] = (int)blue(img.pixels[i]);
    }
  }
  
  void clearChannels(){
    data.clear();
    cols.clear();
    range = -1;
  }
  
}

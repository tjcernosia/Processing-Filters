//***TODO***//
//Support negative numbers
//multichannel display



public class histogram {

  PImage img;
  ArrayList<int[]> data;
  ArrayList<int[]> cols;
  int channelCount;
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
  }

 //****------------Draw functions------------****//

  //draw hist with instance variables
  void draw(float x, float y, float height) {
    println("( " + x + ", " + y + ")");
    makeCols();
    float max = max(cols);

    for (int i = 0; i < cols.length; i++) {
      float colHeight = map(cols[i], 0, max, 0, height);
      stroke(100,200);
      line(x+i, y, x+i, y-colHeight);
      stroke(0);
      point(x+i, y - colHeight);
    }
  }
  
  //draw data
  void draw(float x, float y, float height, int range, int[] data) {
    this.data = data;
    cols = new int[range];
    
    drawHelper(x,y,height);
  }
  
  //draw img
  void draw(float x, float y, float height, PImage img) {
    
    initImage(img);
    drawHelper(x,y,height);
  }
  
 //****------------Helper Functions------------****//
  
  private void drawHelper(float x,float y,float height){
    
    //init columns
    makeCols();
    
    if(drawAxis){
      line(x-1,y,x-1,y-height);
      line(x-1,y+1,x+256,y+1);
    }
    
    //determine max value in all columns
    float max = 0;
    
    for(int i = 0; i < cols.size();i++){
      float currentMax = max(cols.get(i));
      if(currentMax > max)
        max = currentMax;
    }
    
    //draw each channel
    for(int i = cols.size() - 1; i >= 0; i--){
      int[] current = cols.get(i);
      for(int j = 0; j < current.length; j++){
        float colHeight = map(current[j],0,max,0,height);
        stroke(100,200);
        line(x+i, y, x+i, y-colHeight);
        stroke(0);
        point(x+i, y - colHeight);
      }
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
    img.loadPixels();
    int len = img.pixels.length;
    //one array each for brightness and r,g,b channels 
    for(int i = 0; i < 4; i++){
      data.add(new int[len]);
      cols.add(new int[256]);
    }
    
    //copy values into data
    for(int i = 0; i < len; i++){
      data.get(0)[i] = (int)brightness(img.pixels[i]);
      data.get(1)[i] = (int)red(img.pixels[i]);
      data.get(2)[i] = (int)green(img.pixels[i]);
      data.get(3)[i] = (int)blue(img.pixels[i]);
    }
  }
  
}

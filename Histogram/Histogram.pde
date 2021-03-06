//***TODO***//
//Support negative numbers

public class histogram {

  PImage img;
  ArrayList<int[]> data;
  ArrayList<int[]> cols;
  color[] channelColors;
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
    channelColors = new color[256];
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
  
  void setChannelColor(int idx, color c){
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
    data.add(d);
    cols.add(new int[range]);
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
        stroke(80,130);
        line(x+j, y, x+j, y-colHeight);
        stroke(0);
        point(x+j, y - colHeight);
      }
    }
    
    //draw channel cap
    for(int i = cols.size() - 1; i >= 0; i--){
      int[] current = cols.get(i);
      stroke(channelColors[i]);
      noFill();
      beginShape();
      for(int j = 0; j < current.length; j++){
        float colHeight = map(current[j],0,max,0,height);
        vertex(x+j,y-colHeight); 
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
    
    //set channel colors
    channelColors[0] = color(100,200); //brightness channel
    channelColors[1] = color(200,0,0); //red channel
    channelColors[2] = color(0,200,0); //green channel
    channelColors[3] = color(0,0,200); //blue channel
  }
  
  void clearChannels(){
    data.clear();
    cols.clear();
    for(int i = 0; i < channelColors.length; i++){
      channelColors[i] = 0;
    }
  }
  
}

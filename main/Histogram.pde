public class Histogram{
  
  
  float x,y;
  float[] data;
  int[] cols;
  float bucket;
  float colsize;
  
  public Histogram(float x, float y, int range){
    this.x = x;
    this.y = y;
    bucket = 1;
    colsize = 1;
    cols = new int[range];
  }
  
  void updateData(float[] d){
    data = d;
  }
  
  void makeCols(){
    for(int i = 0; i < data.length; i++){
      cols[(int)data[i]] += 1;
    }
  }
  
  void draw(){
    makeCols();
    
    for(int i = 0; i < cols.length; i++){
      line(x, y, x + cols[i], y);
    }
  }
  
}

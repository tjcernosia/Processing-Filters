class multithread extends Thread{
  
  private Thread t;
  private String threadName;
  int steps;
  int offset;
  
  public multithread(String name, int steps){
    threadName = name;
    this.steps = steps;
  }
  
  public void run(){
    println("Running: " + threadName);
    try{
      
      shape s;
      
      for(int i = 0; i < steps; i++){
        float extent = random(shapeMinSize, shapeMaxSize);
        float x = random(canvas.width - extent);
        float y = random(canvas.height - extent);
        
        switch((int)random(3)){
          case(0):
            s = new circle(x,y,extent);
            break;
          case(1):
            s = new square(x,y,extent);
            break;
          case(2):
            s = new triangle(x,y,extent);
            break;
        }
        
        s = null;
        System.gc();
        
        println("STEP " + (++stepCount) + " COMPLETE");
      }
    } catch (Exception e){
      System.out.println("THREAD ERROR" + e);
    }
    
    println("FINISHED " + threadName);
    canvas.save("examples/finished.jpg");
  }
  
  public void start(){
    println("Starting: " + threadName + " " + steps + " Steps");
    if(t == null){
      t = new Thread(this, threadName);
      t.start();
    }
  }
  
}

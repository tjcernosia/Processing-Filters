class node{
  
  ArrayList<node> branches;
  String data;
  int numNodes;
  float w,x,y,step; 
  
  public node(String s, float x, float y, float w, float step){
    
    this.w = w;
    this.x = x;
    this.y = y;
    data = s;
    this.step = step;
    
    branches = null;

  }
  
  void addBranch(String s){
    //create node
    node n = new node(s, x, y + step, w/numBranches(), step);
    
    //check if node has branches
    if(branches == null){
      branches = new ArrayList<node>();
    }
    
    branches.add(n);
    
    //adjust spacing
    float startX = x - w/2 + w/(numBranches() * 2);
    float xStep = w/numBranches();
    
    for(int i = 0; i < numBranches(); i++){
      node current = branches.get(i);
      current.x = startX + xStep * i;
      current.w = xStep;
    }
  }
  
  int numBranches(){
    if(branches == null) return 1;
    return branches.size();
  }
  
  void draw(){
    //draw text
    textAlign(CENTER);
    text(data, x, y);
    
    //draw branches
    for(int i = 0; i < numBranches(); i++){
      if(branches != null){
        node current = branches.get(i);
        
        line(x,y,current.x, current.y);
        current.draw();
      }
    }
  }
  
}

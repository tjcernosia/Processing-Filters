import java.util.*;

node grid[][] = new node[8][8];
HashSet<node> nodes = new HashSet<node>(512);

void setup(){
  size(800,800);
  
  for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
      int xPos = 100*i;
      int jPos = 100*j;
      grid[i][j] = new node(xPos, jPos, 100);
    }
  }
  
  initNodes(new node(0,0,0),0);
  
  stroke(255);
  strokeWeight(1);
}

void draw(){
  for(int i = 0; i < 8; i++){
    for(int j = 0; j < 8; j++){
      grid[i][j].update();
      grid[i][j].draw();
    }
  }
}

void initNodes(node n, int i){
  if(i >= 9){
    nodes.add(n);
    return;
  }
  
  initNodes(n.clone(n),i+1);
  n.pixels[i/3][i%3].isOn = true;
  initNodes(n.clone(n),i+1);
  
}

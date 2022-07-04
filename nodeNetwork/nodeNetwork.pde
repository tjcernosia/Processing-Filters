class network {

  ArrayList<node> nodes;
  ArrayList<spring> connections;

  public network() {
    nodes = new ArrayList<node>();
    connections = new ArrayList<spring>();
  }

  void randPopulate(int numNodes, int numConnections, int minX, int minY) {
    for (int i = 0; i < numNodes; i++) {
      node current = new node(random(-1000,3000), random(-1000,2400));
      nodes.add(current);
    }

    for (int i = 0; i < numConnections; i++) {
      int k = (int)random(numNodes);
      int j = (int)random(numNodes);
      if(k == j) continue;

      connections.add(new spring(nodes.get(k),nodes.get(j)));
    }
  }
  
  void draw(){
    for(spring s: connections){
      s.update();
      s.draw();
    }
    for(node n: nodes){
      n.attract(nodes);
      n.update();
      //n.drawNode();
    }
    
    
  }
}

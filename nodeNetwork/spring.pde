class spring {

  node fromNode;
  node toNode;

  float length = 50;
  float stiffness = .07;
  float damping = .99;

  spring(node toNode, node fromNode) {
    toNode.connections++;
    fromNode.connections++;
    this.toNode = toNode;
    this.fromNode = fromNode;
  }

  void update() {
    PVector diff = PVector.sub(toNode, fromNode);
    diff.normalize();
    diff.mult(length);
    PVector target = PVector.add(fromNode, diff);

    PVector force = PVector.sub(target, toNode);
    force.mult(.5);
    force.mult(stiffness);
    force.mult(1-damping);

    toNode.velocity.add(force);
    fromNode.velocity.add(PVector.mult(force, -1));
  }

  void draw() {
    stroke(map(PVector.dist(fromNode, toNode), 0, 500, 100, 150), 88, 255-map(PVector.dist(fromNode, toNode), 0, 2000, 0, 200));
    strokeWeight(map(PVector.dist(fromNode, toNode), 0, 500, 1, 10));
    line(toNode.x,toNode.y,fromNode.x,fromNode.y);
  }
}

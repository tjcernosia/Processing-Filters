node tree = new node("start", 250,500 ,500,-100);

void setup(){
  size(500,500);
  tree.addBranch("yo");
  tree.addBranch("bro");
  tree.addBranch("lo");
  tree.branches.get(1).addBranch("second");
  tree.branches.get(1).addBranch("secondsecond");
  tree.branches.get(0).addBranch("first");
  tree.branches.get(0).addBranch("firstfirst");
  tree.branches.get(0).branches.get(0).addBranch("wow");
  tree.branches.get(0).branches.get(0).addBranch("wowee");
  noLoop();
}

void draw(){
  tree.draw();
}

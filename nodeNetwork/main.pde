import java.util.*;

network n;
attractor a;
attractor a2;

void setup(){
  fullScreen();
  n = new network();
  n.randPopulate(150,400,30,30);
  background(255);
  colorMode(HSB, 255,255,255);
  a = new attractor(width/4,height/4);
  a2 = new attractor(3*width/4, 3*height/4);
}

void draw(){
  //background(255,255,255,0);
  a.attract(n.nodes);
  a2.attract(n.nodes);
  n.draw();
}

void keyPressed(){
  if(key == 's'){
    save("image.png");
  }
  if(key == 'r'){
    //background(0);
    n.nodes.clear();
    n.connections.clear();
    n.randPopulate(150,300,30,30);
  }
}

float numRects;
float rotations;
float rectSize;

void setup(){
  size(800,800);
  numRects = 3;
  rotations = .2;
  rectSize = 600;
  noLoop();
  noFill();
  rectMode(CENTER);
}

void draw(){
  println("DRAW: " + numRects + " " + rotations);
  fill(255);
  translate(400,400);
  rect(0,0,800,800);
  noFill();
  for(int i = 0; i < numRects; i++){
    rect(0, 0, rectSize*((numRects-i)/numRects), rectSize*((numRects-i)/numRects));
    rotate(2*rotations*PI/numRects);
  }
  return;
}

void keyPressed(){
  if(keyCode == LEFT){
    numRects -= 1;
  }
  else if(keyCode == RIGHT){
    numRects += 1;
  }
  else if(keyCode == UP){
    rotations += .01;
  }
  else if(keyCode == DOWN){
    rotations -= .01;
  }
  else if(keyCode == 'r'){
    rect(0,0,800,800);
  }
  
  redraw();
}

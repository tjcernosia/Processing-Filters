int fps = 30;
int numBalls = 10;
circle[] balls = new circle[numBalls];

void setup(){
  size(500,500);
  frameRate(fps);
}

void draw(){
  
}

void populate(){
  for(int i = 0; i < numBalls; i++){
    balls[i] = new circle(random(500), random(500), random(10));
  }
}

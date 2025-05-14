int numRect = 40;
float initialSize = 1500;
int timestamp = 0;
int period = 60;
float maxRotation = radians(180/numRect);

void setup(){
  fullScreen();
  rectMode(CENTER);
  colorMode(HSB, 100,100,100);
  noStroke();
}

void draw(){
  timestamp++;
  float size = initialSize + map(sin(radians(timestamp)), -1, 1, 0, 500);
  float sizeDelta = size/numRect;
  float rotation = map(sin(radians(timestamp)), -1, 1, -maxRotation, maxRotation);
  
  //background(255,255,255);
  translate(width/2,height/2);
  
  for(int i = 0; i < numRect; i++){
    //translate(width/4, height/4);
    size -= sizeDelta;
    
    float hue = map(sin(radians(timestamp)), -1, 1, 0, 50) + map(size, 0, initialSize, 0, 50); 
    
    fill(hue,100,100);
    
    rect(0,0,size,size);
    rotate(rotation);
  }
}

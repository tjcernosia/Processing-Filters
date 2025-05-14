int numRect = 30; //change the number of squares
float initialSize = 1500; //change the initialsize of squares
int timestamp = 0; //initialize counter
float maxRotation = radians(360/numRect); //change maximum rotation when sin = -1 or 1

void setup(){ //setup loop runs once 
  fullScreen();
  rectMode(CENTER); //draw rectangles from center
  colorMode(HSB, 100,100,100); //rgb gets really brown when you shift through colors
  noStroke(); //get rid of outlines
}

//draw loop loops indefinitely after setup 
void draw(){ 
  timestamp++; //every draw iteration increment counter 
  float size = initialSize + map(sin(radians(timestamp)), -1, 1, 0, 500); //size shifts with sin, doesn't change size of smallest shape
  float sizeDelta = size/numRect; //calculate how much smaller each rectangle should be from the last
  
  // treat our timestamp as a degree measure, convert to radians
  // map output of sin (-1,1) to max and min rotation calculated at start
  float rotation = map(sin(radians(timestamp)), -1, 1, -maxRotation, maxRotation);  
  
  //background(255,255,255);
  
  // shift 0,0 to the center of our canvas 
  translate(width/2,height/2);
  
  // draw our rectangles
  for(int i = 0; i < numRect; i++){
    
    // I guess I could move this to after we draw rectangles
    size -= sizeDelta;
    
    //decide color based on weird mapping, you can fiddle with last two numbers in each map to mess with colors
    float hue = map(sin(radians(timestamp)), -1, 1, 0, 50) + map(size, 0, initialSize, 0, 50); 
    
    // set color of rectangle we are about to draw
    fill(hue,100,100);
    
    // draw rectangle
    rect(0,0,size,size);
    
    rotate(rotation);
  }
}

PImage master;

String imgPrefix = "images/img";
String imgExt = ".jpg";
ArrayList<PImage> images = new ArrayList<PImage>();

PGraphics canvas;

void setup(){
  
  size(500,500);
  
  //****LOAD IMAGES****//
  master = loadImage("img1.jpg");
  master.loadPixels();
  
  int numImages = 10;
  
  for(int i = 0; i < numImages; i++){
    try {
      PImage current = loadImage(imgPrefix + i + imgExt);
      current.loadPixels();
      images.add(current);
      println(imgPrefix + i + imgExt + " success");
    } catch(Exception e){
      println("Image: " + imgPrefix + i + imgExt + " not found");
    }
  }
  
  noLoop();
}

float getBrightness(PImage image){
  
  
  return -1;
}

void draw(){
  image(images.get(3),0,0);
}

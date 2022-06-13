PImage master;

String imgPrefix = "images/img";
String imgExt = ".jpg";
ArrayList<PImage> images = new ArrayList<PImage>();
shape[] shapes = new shape[1];
shape s;

PGraphics canvas;

void setup(){
  
  size(600,600);
  
  //****LOAD IMAGES/CREATE CANVAS****//
  master = loadImage("images/img9.jpg");
  master.loadPixels();
  
  int numImages = 10;
  
  for(int i = 0; i < numImages; i++){
    try {
      PImage current = loadImage(imgPrefix + i + imgExt);
      current.loadPixels();
      images.add(current);
      //println(imgPrefix + i + imgExt + " success");
    } catch(Exception e){
      //println("Image: " + imgPrefix + i + imgExt + " not found");
    }
  }
  
  //****INIT SHAPES****//
  s = new circle(900,1500,300);
  
  noLoop();
}

float getBrightness(PImage image){
  float sum = 0;
  image.loadPixels();
  
  color[] pixels = image.pixels;
  
  for(int i = 0; i < pixels.length; i++){
    sum += brightness(pixels[i]);
  }
  return sum/pixels.length;
}

color getTint(PImage image){
  image.loadPixels();
  float red = 0;
  float green = 0;
  float blue = 0;
  
  for(int i = 0; i < image.pixels.length; i++){
    red += red(image.pixels[i]);
    green += green(image.pixels[i]);
    blue += blue(image.pixels[i]);
  }
  
  color c = color(red/image.pixels.length, green/image.pixels.length, blue/image.pixels.length);
  
  return c;
}

void draw(){
  image(s.img,0,0);
  image(master.get(900,1500,300,300),300,0);
}

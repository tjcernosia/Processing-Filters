import java.util.*;

//********SKETCH SETTINGS********//
//make sure to change master image
//path in setup();
int scale = 2;
int framecount = 0;
int shapecount = 20000;
String imgPrefix = "images/img";
String imgExt = ".jpg";
//0 = brightness 
//1 = hue 
//2 = hue and brightness
int mode = 2;

//********VARIABLES********//
PImage master;
ArrayList<PImage> images = new ArrayList<PImage>();
PGraphics canvas;

void setup(){
  
  //********LOAD IMAGES/CREATE CANVAS********//
  master = loadImage("images/img9.jpg");
  master.loadPixels();
  
  canvas = createGraphics(master.width * scale, master.height * scale);
  canvas.beginDraw();
  canvas.background(255);
  canvas.fill(0);
  canvas.noStroke();
  canvas.endDraw();
  
  int numImages = 15;
  
  for(int i = 0; i < numImages; i++){
    try {
      PImage current = loadImage(imgPrefix + i + imgExt);
      current.loadPixels();
      images.add(current);
      println(imgPrefix + i + imgExt + " success");
    } catch(Exception e){
      //println("Image: " + imgPrefix + i + imgExt + " not found");
    }
  }
  
  Collections.shuffle(images);
  
  noLoop();
}

void draw(){
  shape current;
  for(int i = 0; i < shapecount; i++){
    float extent = random(10,100);
    float x = random(canvas.width - extent);
    float y = random(canvas.height - extent);
    
    switch((int)random(3)){
      case(0):
        current = new circle(x,y,extent);
        break;
      case(1):
        current = new square(x,y,extent);
        break;
      case(2):
        current = new triangle(x,y,extent);
        break;
    }
    
    //shuffle order of images so more likely to find slice from different image
    Collections.shuffle(images);
    //clean memory
    current = null;
    System.gc();
    
  }
  
  println("FINISHED");
  canvas.save("examples/finished.jpg");
  exit();
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
  
  //println("RED: " + red(c) + " GREEN: " + green(c) + " BLUE: " + blue(c));
  
  return c;
}

float getHue(PImage img){
  float sum = 0;
  
  img.loadPixels();
  
  color[] p = img.pixels;
  
  for(int i = 0; i < p.length; i++){
    sum += hue(p[i]);
  }
  
  return sum/p.length;
}

float getDiff(PImage img1, PImage img2){
  
  switch(mode){
    //brightness
    case(0):
      return sqrt(pow(getBrightness(img1) - getBrightness(img2), 2));
    //hue
    case(1):
      return sqrt(pow(getHue(img1) - getHue(img2), 2));
    //hue and brightness
    case(2):
      return sqrt(pow(getBrightness(img1) + getHue(img1) - getBrightness(img2) - getHue(img2), 2));
  }
  
  return -1;
}

boolean checkDiff(PImage img1, PImage img2, float tolerance){
  switch(mode){
    //brightness
    case(0):
      if(sqrt(pow(getBrightness(img1) - getBrightness(img2), 2)) < tolerance)
        return true;
    //hue
    case(1):
      if(sqrt(pow(getHue(img1) - getHue(img2), 2)) < tolerance)
        return true;
    //hue and brightness
    case(2):
      if(sqrt(pow(getHue(img1) - getHue(img2), 2)) < tolerance && sqrt(pow(getBrightness(img1) - getBrightness(img2), 2)) < tolerance)
        return true;
  }
  
  return false;
}

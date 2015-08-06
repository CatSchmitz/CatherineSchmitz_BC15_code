PFont baskOldFace;
PImage ballerina;
int counter =0;
void setup(){
  background(0);
  size(700, 700);
  baskOldFace = loadFont("Baskerville-48.vlw");
  imageMode(CENTER);
  ballerina = loadImage("ballerina-design.png");
  
}

void draw(){
  counter++;
  textFont(baskOldFace, 48);
  fill(255);
  text("Dance.", width/2 + 100 , counter);
  pushMatrix();
  translate(width/2, counter);
  rotate(radians(frameCount));
  tint(255, 127);
  image(ballerina, 0, 0 );
  popMatrix();
  
  
  int x = int(random(ballerina.width));
  int y = int(random(ballerina.height));
  int loc = x + y * ballerina.width;
  
  loadPixels();
  noStroke();
  
  float r = red(ballerina.pixels[loc]);
  float g = green(ballerina.pixels[loc]);
  float b = blue(ballerina.pixels[loc]);
  
  fill(r,g,b,20);  
  rect(random(width), random(height), counter, counter);
  
  
}

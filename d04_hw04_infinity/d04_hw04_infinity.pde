float r = 0;
float theta = 0;

void setup(){
  size(600, 600);
  background(0);
}

void draw(){
  fill(0,10);
  rect(0,0,width,height);

  float x = r * cos(theta);
  float y = r * sin(theta) * cos(theta);
  
  translate(width/2, height/2);
  fill(random(255),random(255),random(255), random(100,200));
  
  noStroke();
  ellipse(x,y,mouseX,mouseX);
  
  theta += 0.55;
  r += 0.2;
}


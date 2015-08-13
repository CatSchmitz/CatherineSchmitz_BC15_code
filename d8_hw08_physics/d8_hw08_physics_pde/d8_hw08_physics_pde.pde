PVector pos = new PVector(100, 100);
PVector speed = new PVector(2.5, 2);

PVector pos2 = new PVector(10, 200);
PVector speed2 = new PVector(2, 2.5);

boolean haveHit = false;

int size = 40;


void setup() {
  size(700,700);
  smooth();  
  background(255);
}

void draw() {
  fill(255,10);
  noStroke();
  rect(0,0,width,height);
  
  pos.add(speed);
  pos2.add(speed2);
  
  if (pos.x > width || pos.x < 0) {
    speed.x *= random(-2, -.5);  
  } 
  if (pos.y > height || pos.y < 0) {
    speed.y *= random(-2, -.5);  
  } 
  
  if (pos2.x > width || pos2.x < 0) {
    speed2.x *= random(-2, -.25);  
  } 
  if (pos2.y > height || pos2.y < 0) {
    speed2.y *= random(-2, -.25);  
  } 
  
  if(dist(pos.x, pos.y, pos2.x, pos2.y) <= size/2){
    size = size/2;
    if(size <= 1){
      size = int(random(10, 50));
    }
  }
  
  
  fill(200);
  ellipse(pos.x, pos.y, size, size);
  
  fill(127);
  ellipse(pos2.x, pos2.y, size, size);
}



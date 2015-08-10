void setup(){
size(500,500);
background(0);
}

void draw(){
  for(int j= 0; j < height; j++){
    for(int i=0; i < width; i++){
    fill(random(255), random(255), random(255), 127);
    noStroke();
    rect(5*i, j*5, i/10,i/10);
    }
  }
  
}

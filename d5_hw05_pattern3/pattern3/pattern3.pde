void setup(){
  size(500,500);
  background(0);
}


void draw(){
  for(int j=1; j < width; j++){
    for(int i=0; i< height; i++){
      noStroke();
      fill(random(255), random(255), random(255), 127);
      ellipse(i*10,j*10,mouseX/25,mouseX/25);
    }
  }
  
}

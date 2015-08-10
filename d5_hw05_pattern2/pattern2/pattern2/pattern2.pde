void setup(){
  size(500,500);
}

void draw(){
  for(int j=0; j < mouseX; j+= 10){
    for(int i = 0; i < mouseY; i+= 10){
    fill(mouseX, mouseY, i, j); 
    noStroke(); 
    ellipse(i,j,10,10);
    ellipse(i, j, 5,5);
    }
  

  }
  

}

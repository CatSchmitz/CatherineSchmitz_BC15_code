int[][] points = new int[100][2];
  
void setup(){
  size(500,500);
  

}

void draw(){
  background(255);
   //populate the 2d array with random points
    for(int i =0; i < points.length; i++){
        points[i][0] = int(random(width)); 
        points[i][1] = int(random(height));
      
    }
    
    //draw the 2d array onto the screen  
    for(int i =0; i < points.length - 1; i++){
      strokeWeight(abs(pmouseX - mouseX));
      line(points[i][0], points[i][1], points[i+1][0], points[i+1][1]);
      ellipse(points[i][0], points[i][1], 5,5);
    }
    
}

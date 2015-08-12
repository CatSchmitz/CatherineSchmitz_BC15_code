int[][] points = new int[20][2];
  
void setup(){
  size(500,500);
  frameRate(10);
}

void draw(){
  background(255);
  pushMatrix();
  translate(width/2 - int(random(abs(pmouseX - mouseX))), height/2 - int(random(abs(pmouseY - mouseY))));
   //populate the 2d array with random points
    for(int i =0; i < points.length; i++){
        points[i][0] = int(random(abs(pmouseX - mouseX))); 
        points[i][1] = int(random(abs(pmouseY - mouseY)));
    }
    
    //draw the 2d array onto the screen  
    for(int i =0; i < points.length - 1; i++){
      strokeWeight(0.1);
      line(points[i][0], points[i][1], points[i+1][0], points[i+1][1]);
      ellipse(points[i][0], points[i][1], 5,5);
    }
    popMatrix();
}

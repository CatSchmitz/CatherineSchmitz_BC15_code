import processing.sound.*;

void setup(){
  size(500,500);
}

class Monster{ 
   Monster(int xpos, int ypos, int size){
    
     //draw the body of the creature 
     noStroke();
     fill(0);
     for(int i=1; i < size; i++){
       ellipseMode(CENTER);
       ellipse(xpos + random(size + size/2), ypos + random(size + size/2), size, size);
     }
     fill(255);
     ellipseMode(CENTER);
     //eyes
     ellipse(xpos + size/2, ypos + size/2, size/2, size/2);
     ellipse(xpos + size, ypos + size/2, size/2, size/2);
     //pupils
     fill(0);
     ellipse(xpos + size/2, ypos + size/2, size/10, size/10);
     ellipse(xpos + size, ypos + size/2, size/10, size/10);
     

     
     
     //draw the eyes of the creature
   }
  
}

void draw(){
    background(255);
    Monster m1 = new Monster(250, 250, mouseX);

 
}
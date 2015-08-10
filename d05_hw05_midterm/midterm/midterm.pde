//Cat Schmitz 
//code midterm
// 3 new things not learned in class: arrays, libraries, objects(sound objects)
//Goal: to explore different ways of visualizing data

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
int size;
int state = 1; 
float [] points = new float[12];

//state 3
int ellipseMove = 1;


Minim audioRead;
AudioInput input;

float r = 0;
float speed = 10;
int frame_counter = 0; 

void setup(){
  size(700, 700);
  background(255);
  
  audioRead = new Minim(this);
  input = audioRead.getLineIn();
}

void draw(){
    size = 0;
    for(int i= 0; i < input.bufferSize() -1; i++){
       size += (int)((abs(input.left.get(i)) + abs(input.right.get(i))) * 10000);
    } 
    
      float avgSize = size/float(input.bufferSize()-1);
      map(avgSize, 0, 1000, 0, 500);
      println(avgSize);
  if(state == 1){

  float x = r * cos(frame_counter * speed);
  float y = r * sin(frame_counter * speed);
  
  translate(width/2, height/2);
  
  fill(mouseX,random(255),random(255), 200);
  
  noStroke();
  
  ellipse(x, y, avgSize/10,avgSize/10);
  fill(random(255),random(255),random(255), 200);
 
  r = avgSize/10;
  frame_counter++;
  
 if(x >= width || y >= height){
   r = 0;
  frame_counter = 0;  
 }
  }
    
  if(state == 2){
    background(0);
  for(int j=1; j < avgSize; j++){
      for(int i=0; i< avgSize; i++){
        noStroke();
        fill(random(255), random(255), random(255), avgSize);
        ellipse(i*10,j*10,mouseX/25,mouseX/25);
      }
    }
  }
    if(state == 3){
      background(255);
      for(int i=0; i < width; i+=10){
        fill(random(255), random(255), random(255));
         ellipse(i, avgSize + random(avgSize), avgSize, avgSize);
      } 

    }
  if(state == 4){
    background(0);
      for(int i=0; i < width; i+=10){
        fill(random(255), random(255), random(255), avgSize);
         rect(i, height - avgSize, i, height - avgSize);
      } 

  }
  if(state == 5){
    background(255);
    for(int i=0; i < points.length; i++){
      points[i] = random(avgSize);
    }
    fill(0);
    strokeWeight(5);
    beginShape();
      vertex(points[0], points[1]);
      vertex(points[2], points[3]);
      vertex(points[4], points[5]);
      vertex(points[6], points[7]);
      vertex(points[8], points[9]);
      vertex(points[10], points[11]);
    endShape(CLOSE);
  }
  
  
  
  
}

void keyPressed(){
  if(state > 5){
     state = 1; 
   }
   state++;
   
}

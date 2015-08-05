//import the minim library to analyze the sound in the microphone

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Monster m1;
Monster m2;
Monster m3;
int noiseCounter = 0;

Minim audioRead;
AudioInput input;

int size = 10;

void setup(){
  size(750,750);
  
  //create the new input and audio objects
  audioRead = new Minim(this);
  input = audioRead.getLineIn();
  m1 = new Monster(200, 300, color(0,0,0));
  m2 = new Monster(200, 100, color(255,0,102));
  m3 = new Monster(200, 600, color(255,0,255));
}

class Monster{ 
  //set default monster size  
  int monsterSize = 10; 
  int xpos;
  int ypos;
  color colorm;
  
  //constructor places monster somewhere
  Monster(int _xpos, int _ypos, color _colorm){
      xpos = _xpos;
      ypos = _ypos; 
      colorm = _colorm;
   }
   
   void drawMonster(){
   //draw the body of the creature 
     noStroke();
     fill(colorm);
     for(int i=1; i < monsterSize; i++){
       ellipseMode(CENTER);
       ellipse(xpos + random(monsterSize + monsterSize/2), ypos + random(monsterSize + monsterSize/2), monsterSize, monsterSize);
     }
     
     fill(255);
     ellipseMode(CENTER);
     //eyes
     ellipse(xpos + monsterSize/2, ypos + monsterSize/2, monsterSize/2, monsterSize/2);
     ellipse(xpos + monsterSize, ypos + monsterSize/2, monsterSize/2, monsterSize/2);
     //pupils
     fill(0);
     ellipse(xpos + monsterSize/2, ypos + monsterSize/2, monsterSize/10, monsterSize/10);
     ellipse(xpos + monsterSize, ypos + monsterSize/2, monsterSize/10, monsterSize/10);
    

    println("msize " + monsterSize);
      
   }
   
   
   void changeSize(int audioSize){
     monsterSize = audioSize;
   }
   
   void changeColor(){
     colorm = color(random(255), random(255), random(255));
   }
}

void draw(){
//    println("buffer size" + input.bufferSize());
    //read and analyze the sound coming in 
    size = 0;
    for(int i= 0; i < input.bufferSize() -1; i++){
//      println("left: " + input.left.get(i));
       size += (int)((abs(input.left.get(i)) + abs(input.right.get(i))) * 10000);
    } 
    
      float avgSize = size/float(input.bufferSize()-1);
      float mappedAvgSize = map(avgSize, 0, 700, 10, 400);
      println("size: " + size);
      println("avgSize: " + avgSize);
      println("mappedAvgSize: " + avgSize);
      background(255);
      
      m1.changeSize(int(mappedAvgSize));
      m1.drawMonster();
      m2.changeSize(int(mappedAvgSize));
      m2.drawMonster();
      m3.changeSize(int(mappedAvgSize));
      m3.drawMonster();
      
      if(int(avgSize) > 150){
        
        background(255, 0, 0);
        m2.changeSize(int(mappedAvgSize));
        m2.drawMonster();
        m1.changeSize(int(mappedAvgSize));
        m1.drawMonster();
        m3.changeSize(int(mappedAvgSize));
        m3.drawMonster();
        noiseCounter++;
        println("noiseCounter" + noiseCounter);
      }
       // when the noise levels are low, show them acting crazy from hearing too much noise.
       else if(noiseCounter > 15){
          background(0);
          m1.changeSize(int(mappedAvgSize));
          m1.drawMonster();
          m1.changeColor();
          m2.changeSize(int(mappedAvgSize));
          m2.drawMonster();
          m2.changeColor();
          m3.changeSize(int(mappedAvgSize));
          m3.drawMonster();
          m3.changeColor();
          
          textSize(22);
          fill(255);
          text("You've made too much noise. The monsters have gone crazy!", 10, 50); 

       }
}

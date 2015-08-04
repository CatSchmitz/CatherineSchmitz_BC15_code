//import the minim library to analyze the sound in the microphone

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Monster m1;

Minim audioRead;
AudioInput input;

int size = 10;

void setup(){
  size(500,500);
  
  //create the new input and audio objects
  audioRead = new Minim(this);
  input = audioRead.getLineIn();
  m1 = new Monster(200, 200);

}

class Monster{ 
  //set default monster size  
  int monsterSize = 100; 
  int xpos;
  int ypos;
  
  //constructor places monster somewhere
  Monster(int _xpos, int _ypos){
      xpos = _xpos;
      ypos = _ypos; 
   }
   
   void drawMonster(){
   //draw the body of the creature 
     noStroke();
     fill(0);
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
      println("size: " + size);
      println("avgSize: " + avgSize);
      background(255);
      m1.changeSize(int(avgSize));
      m1.drawMonster();
    

}


import processing.io.*;


boolean CurrentState = false;
boolean PreviousState = false;

  PImage img1;
  PImage img2;
  import processing.video.*;
  Movie mov;


void setup(){
  size(570,900);
  
  img1=loadImage("interactive_poster.png");

   GPIO.pinMode(7, GPIO.INPUT);
   while(GPIO.digitalRead(7) == GPIO.HIGH){
   }
    mov = new Movie(this, "pink bg.mp4");
  mov.loop();
  mov.speed(2);
  mov.volume(0);   
  
  }
    void movieEvent(Movie m) {
  m.read();
}

void draw(){
  img2=loadImage("poster.png");
 
  if(PreviousState){
    delay(10000);
  }
  if(GPIO.digitalRead(7) == GPIO.HIGH){
  CurrentState = true;
  }
  if(CurrentState){
    
image(mov,135,250,350,330);
     
      PreviousState = true;
    }
    if(GPIO.digitalRead(7) == GPIO.LOW){
    CurrentState = false;
    PreviousState = false;
  }
}

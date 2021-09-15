//variable 
PImage Background;
Ship ship;
float hw, hh;

//setup
void setup(){
  fullScreen();
  Background = loadImage("Background.jpeg");
  imageMode(CENTER);
  rectMode(CENTER);
  hw = width/2;
  hh = height/2;
  ship = new Ship();
}



//draw
void draw(){
  image(Background,width/2,height/2);
  controls();
  ship.display();
}

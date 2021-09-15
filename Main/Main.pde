//variable 
PImage Background;
PImage SCLVL1;
PImage SCLVL2;
PImage SCLVL3;
Ship ship;
float hw, hh;

//setup
void setup(){
  fullScreen();
  Background = loadImage("Background.jpeg");
  SCLVL1 =loadImage("Spacecraftlvl1.png");
  SCLVL2 = loadImage("Spacecraftlvl2.png");
  SCLVL3 =loadImage("Spacecraftlvl3.png");
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

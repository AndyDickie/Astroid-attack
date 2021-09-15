//variable 
PImage Background;
PImage SCLVL;
Ship ship;
float hw, hh;
int lvl;
//setup
void setup(){
  fullScreen();
  Background = loadImage("Background.jpeg");
  SCLVL =loadImage("Spacecraftlvl"+lvl+".png");
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

//variable 
PImage Background;
Ship ship = new Ship();


//setup
void setup(){
  fullScreen();
  Background = loadImage("Background.jpeg");
  imageMode(CENTER);
}



//draw
void draw(){
  image(Background,width/2,height/2);
  controls();
  ship.display();
  
}

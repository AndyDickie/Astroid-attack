//variable 
PImage Background;
PImage SCLVL;
Ship ship;
ArrayList<Question> list1 = new ArrayList<Question>();
Table table;
int id = 0;
int string = 1;
int ans = 2;
float time;
//setup
void setup(){
  fullScreen();
  Background = loadImage("Background.jpeg");
  SCLVL =loadImage("Spacecraftlvl1.png");
  imageMode(CENTER);
  rectMode(CENTER);
  ship = new Ship();
  baggrund =loadImage("Spørgsmåls baggrund.jpeg");
  textAlign(CENTER,CENTER);
  font = createFont("Skrift.vlw",35);
  font2 = createFont("Skrift.vlw",75);
  time = millis();
  refreshList();
}



//draw
void draw(){
  image(Background,width/2,height/2);
  controls();
  ship.run();
  
}

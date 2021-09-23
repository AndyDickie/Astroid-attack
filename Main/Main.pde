//variable 
PImage Background;
PImage SCLVL;
PImage Coinpic;
PImage startup;
PImage shipstart;
PImage astroid;
PImage upgradescreen;
PImage level1;
PImage level2;
PImage level3;
PImage controlsback;
PImage controlsbuttons;
Ship ship;
ArrayList<Question> list1 = new ArrayList<Question>();
Table table;
int id = 0;
int string = 1;
int ans = 2;
AstroidManager astroidManager;
Menu menu;


//setup
void setup() {
  fullScreen();
  loadImages();
  loadObjects();
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  font = createFont("Skrift.vlw", 35);
  font2 = createFont("Skrift.vlw", 75);
  time = millis();
  refreshList();
  smooth();
  frameRate(60);
  
}



//draw
void draw() {
  //Ændre draw loopet til at køre "gameEngine"
  menu.update();
  //game();
}

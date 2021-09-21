//variable 
PImage Background;
PImage SCLVL;
PImage Coinpic;
PImage startup;
PImage startbutton1;
PImage startbutton2;
PImage startbutton3;
PImage shipstart;
PImage astroid;
PImage upgradescreen;
PImage level1;
PImage level2;
PImage level3;
Ship ship;
ArrayList<Question> list1 = new ArrayList<Question>();
Table table;
int id = 0;
int string = 1;
int ans = 2;
AstroidManager astroidManager;
Menu menu;


//setup
void setup(){
  fullScreen();
Background = loadImage("Background.jpeg");
menu = new Menu();
SCLVL =loadImage("Spacecraftlvl1.png");
Coinpic = loadImage("Coin.png");
startup = loadImage("Startup.jpeg");
startbutton1 = loadImage("startup button1.png");
startbutton2 = loadImage("startup button2.png");
startbutton3 = loadImage("startup button3.png");
shipstart = loadImage("Spacecraftlvl32.png");
astroid = loadImage("Astroide.png");
baggrund =loadImage("Spørgsmåls baggrund.jpeg");
level1 = loadImage("Level1.png");
level2 = loadImage("Level2.png");
level3 = loadImage("Level3.png");
upgradescreen = loadImage("upgrades background.jpeg");
  imageMode(CENTER);
  rectMode(CENTER);
  ship = new Ship();
  textAlign(CENTER,CENTER);
  font = createFont("Skrift.vlw",35);
  font2 = createFont("Skrift.vlw",75);
  time = millis();
  refreshList();
  astroidManager = new AstroidManager();
}



//draw
void draw(){
  //Ændre draw loopet til at køre "gameEngine"
 //game();
//menu.homescreen();
menu.upgrades();
  }

    

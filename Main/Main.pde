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
Ship ship;
ArrayList<Question> list1 = new ArrayList<Question>();
Table table;
int id = 0;
int string = 1;
int ans = 2;
AstroidManager astroidManager;


//setup
void setup(){
  fullScreen();
Background = loadImage("Background.jpeg");
SCLVL =loadImage("Spacecraftlvl1.png");
Coinpic = loadImage("Coin.png");
startup = loadImage("Startup.jpeg");
startbutton1 = loadImage("startup button1.png");
startbutton2 = loadImage("startup button2.png");
startbutton3 = loadImage("startup button3.png");
shipstart = loadImage("Spacecraftlvl3.png");
astroid = loadImage("Astroide.png");
baggrund =loadImage("Spørgsmåls baggrund.jpeg");
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
 
  //image(Background,width/2,height/2);
  //controls();
  //ship.run();
  //checkTime();
  //coinscount();
  //astroidManager.run();
  }

    

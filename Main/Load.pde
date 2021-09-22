void loadImages(){
  Background = loadImage("Background.jpeg");
  SCLVL =loadImage("Spacecraftlvl1.png");
  Coinpic = loadImage("Coin.png");
  startup = loadImage("Startup.jpeg");
  shipstart = loadImage("Spacecraftlvl32.png");
  astroid = loadImage("Astroide.png");
  baggrund =loadImage("Spørgsmåls baggrund.jpeg");
  level1 = loadImage("Level1.png");
  level2 = loadImage("Level2.png");
  level3 = loadImage("Level3.png");
  upgradescreen = loadImage("upgrades background.jpeg");
  controlsback = loadImage("Controlsback.jpeg");
  controlsbuttons = loadImage("Controlspic.png");
}

void loadObjects(){
  astroidManager = new AstroidManager();
  menu = new Menu();
  ship = new Ship();
  list1 = new ArrayList<Question>();
  refreshList();
  time = millis();
}

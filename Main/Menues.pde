


class Menu {
int state = 1;
Button startScreen;
Button upgradeScreen;
Button controlScreen;
PImage startbutton1;
PImage startbutton2;
PImage startbutton3;

  Menu(){
    startbutton1 = loadImage("startup button1.png");
    startbutton2 = loadImage("startup button2.png");
    startbutton3 = loadImage("startup button3.png");
    startScreen = new Button(width/2, height-(height/2), (width/3), (height/10), startbutton1);
    upgradeScreen = new Button(width/2, height-height/2.7, width/3, height/10, startbutton2);
    controlScreen = new Button(width/2, height-height/4, width/5, height/12, startbutton3);
  }
  void update(){
    if (state == 0){
      return;
    }
    if (state == 1){
      homescreen();
    }
    if (state == 2){
      upgrades();
    }
    if (state == 3){
      controls();
    }
  }
  
  void homescreen() {
    startScreen.show = true;
    upgradeScreen.show = true;
    controlScreen.show = true;


    image(startup, width/2, height/2);
    image(shipstart, width/4, height/4, width/5, height/3);
    image(astroid, width-width/4, height/4, width/6, height/4);
    //image(startbutton1, width/2, height-height/2, width/3, height/10);
    //image(startbutton2, width/2, height-height/2.7, width/3, height/10);
    //image(startbutton3, width/2, height-height/4, width/5, height/12);
    startScreen.display();
    upgradeScreen.display();
    controlScreen.display();
  }
  
  void upgrades() {
    image(upgradescreen, width/2, height/2); 
    image(startbutton2, width/2, height/4, width/3, height/8);
    image(level1, width/4, height-height/3, width/5, height/3);
    image(level2, width/2, height-height/3, width/5, height/3);
    image(level3, width-width/4, height-height/3, width/5, height/3);
  }

  void controls() {
    image(controlsback, width/2, height/2);
    image(startbutton3, width/2, height/6, width/2, height/6);
    image(controlsbuttons, width/2, height/2, width/2, height/2);
  }
  
  void playscreen() {
    image(Background, width/2, height/2);
    controls();
    ship.run();
    checkTime();
    coinscount();
    astroidManager.run();
  }
}

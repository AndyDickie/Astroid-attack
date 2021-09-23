class Menu {
  int state = 1;
  Button startScreen;
  Button upgradeScreen;
  Button controlScreen;
  PImage startButton;
  PImage upgradeButton;
  PImage controlBotton;

  Menu() {
    startButton = loadImage("startup button1.png");
    upgradeButton = loadImage("startup button2.png");
    controlBotton = loadImage("startup button3.png");
    startScreen = new Button(width/2, height-(height/2), (width/3), (height/10), startButton);
    upgradeScreen = new Button(width/2, height-height/2.7, width/3, height/10, upgradeButton);
    controlScreen = new Button(width/2, height-height/4, width/5, height/12, controlBotton);
  }
  void update() {
    if (state == 0) {
      //return;
      //playscreen();
      game();
    }
    if (state == 1) {
      homescreen();
    }
    if (state == 2) {
      upgrades();
    }
    if (state == 3) {
      controlScreen();
    }
  }

  void homescreen() {
    startScreen.show = true;
    upgradeScreen.show = true;
    controlScreen.show = true;

    image(startup, width/2, height/2);
    image(shipstart, width/4, height/4, width/5, height/3);
    image(astroid, width-width/4, height/4, width/6, height/4);
    startScreen.display();
    upgradeScreen.display();
    controlScreen.display();
  }

  void upgrades() {
    image(upgradescreen, width/2, height/2); 
    image(upgradeButton, width/2, height/4, width/3, height/8);
    image(level1, width/4, height-height/3, width/5, height/3);
    image(level2, width/2, height-height/3, width/5, height/3);
    image(level3, width-width/4, height-height/3, width/5, height/3);
    //text(
  }

  void controlScreen() {
    image(controlsback, width/2, height/2);
    image(controlBotton, width/2, height/6, width/2, height/6);
    image(controlsbuttons, width/2, height/2, width/2, height/2);
  }
  
  void game() {
    if (gameTime) {
      image(Background, width/2, height/2);
      ship.highscore++;
      controls();
      ship.run();
      checkTime();
      coinscount();
      astroidManager.run();
    }

    if (questionTime) {
      showQuestion();
    }
  }
}

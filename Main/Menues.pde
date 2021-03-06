class Menu {
  int state = 5;
  Button startScreen;
  Button upgradeScreen;
  Button controlScreen;
  Button backButton, logoutButton;
  Button level1Button, level2Button, level3Button;
  PImage startButton;
  PImage upgradeButton;
  PImage controlBotton;
  ControlP5 cp5;
  Textfield pass_field, username_field;
  Bang show_password, create_user, login; 
  String user;
  int highscore, globalHighscore;


  Menu(int screenState_, String user_) {
    state = screenState_;
    user = user_;
    startButton = loadImage("startup button1.png");
    upgradeButton = loadImage("startup button2.png");
    controlBotton = loadImage("startup button3.png");
    startScreen = new Button(width/2, height-(height/2), (width/3), (height/10), startButton);
    upgradeScreen = new Button(width/2, height-height/2.7, width/3, height/10, upgradeButton);
    controlScreen = new Button(width/2, height-height/4, width/5, height/12, controlBotton);
    backButton = new Button(width/10, height/10, width/5, height/10, null); 
    logoutButton = new Button(width-width/10, height/10, width/5, height/10, null);
    level1Button = new Button(width/4, height-height/3, width/5, height/3, level1);
    level2Button = new Button(width/2, height-height/3, width/5, height/3, level2);
    level3Button = new Button(width-width/4, height-height/3, width/5, height/3, level3); 
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
    if (state == 4) {
      gameOver();
    }
    if (state == 5) {
      loginScreen();
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
    textSize(50);
    text("Logout", width-width/10, height/10);
    textMode(LEFT);
    textSize(20);
    text(user+ " highscore: " + getHighscore(user), width/10, height/10);
    text("All time highscore: " + getGlobalHighscore(), width/10, height/10+50);
  }

  void upgrades() {
    image(upgradescreen, width/2, height/2); 
    image(upgradeButton, width/2, height/4, width/3, height/8);
    level1Button.display();
    level2Button.display();
    level3Button.display();
    textSize(100);
    text("Back", width/10, height/10);
    fill(255, 255, 0);
    textSize(50);
    image(Coinpic, width-width/12+95, height/10+4, width/22, height/14);
    text(ship.coins, width-width/12, height/10);
    text("lvl 1: 0 coins     lvl 2: 100 coins      lvl 3: 200 coins", width/2, height-height/12);
  }

  void controlScreen() {
    image(controlsback, width/2, height/2);
    image(controlBotton, width/2, height/6, width/2, height/6);
    image(controlsbuttons, width/2, height/2, width/2, height/2);
    textSize(100);
    text("Back", width/10, height/10);
    textSize(50);
    text("Go back to the start screen by pressing p", width/2, height-height/12);
  }

  void game() {
    if (gameTime) {
      image(Background, width/2, height/2);
      fill(255, 255, 0);
      textSize(50);
      image(Coinpic, width-width/12+95, height/10+4, width/22, height/14);
      text(ship.coins, width-width/12, height/10);
      text(int(ship.highscore/10), width/12, height/10);
      textMode(LEFT);
      text("HP: " + int(ship.hp), width-width/12, height/6);
      textMode(CENTER);
      ship.highscore++;
      controls();
      ship.run();
      checkTime();
      //coinscount();
      astroidManager.run();
    }

    if (questionTime) {
      showQuestion();
    }
  }

  void gameOver() {
    image(Background, width/2, height/2);
    textSize(50);
    text("Game over, you got " + ship.highscore/10 + " points", width/2, height/2);
    if (ship.highscore/10 > getHighscore(user)){
      insertHighscore(user, ship.highscore/10);
    }
    if (ship.deathTime + 3*1000 < millis()) {
      loadObjects(1, user);
      state = 1;
    }
  }

  void loginScreen() {
    //Knapperne og tekstfelterne bliver aktive n??r dette menu state er aktiv, derfor bliver der ikke k??rt noget s??rligt i funktionen
    textSize(50);
    text("Astroid Attack", width/2, height/2-260);
    }
}

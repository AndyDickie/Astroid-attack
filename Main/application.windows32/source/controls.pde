boolean w, s, a, d;
boolean upgradeFix = false;

void keyPressed() {
  if (key == 'w' || key == 'W') {
    w = true;
    s = false;
  }
  if (key == 's'|| key == 'S') {
    w = false;
    s = true;
  }
  if (key == 'a'|| key == 'A') {
    d = false;
    a = true;
  }
  if (key == 'd'|| key == 'D') {
    d = true;
    a = false;
  }
  
  if (key == CODED) {
    if (keyCode == UP) {
      w = true;
      s = false;
    }
    if (keyCode == DOWN) {
      w = false;
      s = true;
    }
  
    if (keyCode == LEFT) {
      d = false;
      a = true;
    }
    if (keyCode == RIGHT) {
      d = true;
      a = false;
    }
  }

  if ((key == 'p' || key == 'P') && menu.state == 0) {
    menu.state = 1;
    gameTime = false;
    pauseTime = millis();
  }
}
void keyReleased() {
  if (key == 'w'|| key == 'W') {
    w = false;
  }
  if (key == 's'|| key == 'S') {
    s = false;
  }

  if (key == 'a'|| key == 'A') {
    a = false;
  }
  if (key == 'd'|| key == 'D') {
    d = false;
  }
  
  if (key == CODED) {
    if (keyCode == UP) {
      w = false;
    }
    if (keyCode == DOWN) {
      s = false;
    }
  
    if (keyCode == LEFT) {
      a = false;
    }
    if (keyCode == RIGHT) {
      d = false;
    }
  }
}

void mousePressed() {
  if (menu.state == 2 && menu.level2Button.hasClicked() && ship.coins >= 100 && upgradeFix == true){
    ship.lvl = 2;
    SCLVL =loadImage("Spacecraftlvl"+ship.lvl+".png");
    ship.coins -= 100;
  }
  
  if (menu.state == 2 && menu.level3Button.hasClicked() && ship.coins >= 200){
    ship.lvl = 3;
    SCLVL =loadImage("Spacecraftlvl"+ship.lvl+".png");
    ship.coins -= 200;
  }
  
  if (menu.state == 1 && menu.startScreen.hasClicked()) {
    menu.state = 0;
    gameTime = true;
    time = (millis() - (pauseTime - time));
  }
  
  if (menu.state == 1 && menu.upgradeScreen.hasClicked()) {
    menu.state = 2;
    upgradeFix = true;
  }

  if (menu.state == 1 && menu.controlScreen.hasClicked()) {
    menu.state = 3;
  }
  
  if ((menu.state == 2 || menu.state == 3) && menu.backButton.hasClicked()){
    menu.state = 1;
  }
  
  if (menu.state == 1 && menu.logoutButton.hasClicked()){
    background(0);
    displayButtons();
    username_field.setText("");
    pass_field.setText("");
    loadObjects(5, "");
  }
  
  
}

void controls() {
  if (s) {
    ship.moveDown();
  }
  if (w) {
    ship.moveUp();
  }
  if (a) {
    ship.moveLeft();
  }
  if (d) {
    ship.moveRight();
  }
}

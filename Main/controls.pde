boolean w, s, a, d;

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
  
  if (key == ' ') {
    //ship.upgrade();
    gameTime = false;
    loadObjects();
  }

  if (key == 'p' && menu.state == 0) {
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
  if (menu.state == 1 && menu.startScreen.hasClicked()) {
    menu.state = 0;
    gameTime = true;
    time = (millis() - (pauseTime - time));
  }

  if (menu.state == 1 && menu.upgradeScreen.hasClicked()) {
    menu.state = 2;
  }

  if (menu.state == 1 && menu.controlScreen.hasClicked()) {
    menu.state = 3;
  }
  
  if ((menu.state == 2 || menu.state == 3) && menu.backButton.hasClicked()){
    menu.state = 1;
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

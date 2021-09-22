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
  if (key == ' '){
    ship.upgrade();
  }
  
  if (key == 'p' && menu.state == 0){
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

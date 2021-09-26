
class Ship {
  int hp = 5;
  float speed = (width/200);
  float x = width/2;
  float y = height/2;
  float upgrade = 0.2;
  int lvl = 1;
  int coins; 
  int highscore;
  int deathTime;
  
  void display() {
    image(SCLVL, x, y, width/8, height/5);
  }

  void moveRight() {
    x += (speed * (1 + (lvl * upgrade)));
  }

  void moveLeft() {
    x -= (speed * (1 + (lvl * upgrade)));
  }

  void moveUp() {
    if (y <= 0 + (height/15)) {
    } else {
      y -= (speed * (1 + (lvl * upgrade)));
    }
  }

  void moveDown() {
    if (y >= (height - height/15)) {
    } else {
      y += (speed * (1 + (lvl * upgrade)));
    }
  }
  
  void checkBorder() {
    if (x <= (0 - width/20)) {
      x = (width + width/20);
    }
    if (x >= (width + 0.001 + width/20)) {
      x = (0 - width/20);
    }
  }
  void deductHp(){
    if (hp >= 2){
      hp -= 1;
    } else{
      deathTime = millis();
      menu.state = 4;
    }
  }
  
  void run() {
    ship.display();
    ship.checkBorder();
  }
}

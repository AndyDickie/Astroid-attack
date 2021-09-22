
class Ship {
  int hp = 5;
  float speed = (width/120);
  float x = width/2;
  float y = height/2;
  float upgrade = 1;
  int lvl = 1;
  int coins; 
  int highscore;

  void display() {
    image(SCLVL, x, y, width/8, height/5);
  }

  void moveRight() {
    x += (speed * upgrade);
  }

  void moveLeft() {
    x -= (speed * upgrade);
  }

  void moveUp() {
    if (y <= 0 + (height/15)) {
    } else {
      y -= (speed * upgrade);
    }
  }

  void moveDown() {
    if (y >= (height - height/15)) {
    } else {
      y += (speed * upgrade);
    }
  }

  void upgrade() {
    if (lvl < 3) {
      lvl += 1;
      SCLVL =loadImage("Spacecraftlvl"+lvl+".png");
      upgrade += 0.2;
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
      //println(hp);
    } else{
      println("Game Over, you got", highscore/10, "points");
      menu.state = 1;
      loadObjects();
      gameTime = false;
      //exit();
    }
  }
  
  
  void run() {
    ship.display();
    ship.checkBorder();
  }
}

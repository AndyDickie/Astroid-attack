
class Ship {
  int hp;
  float speed = (width/120);
  float x = width/2;
  float y = height/2;
  float upgrade = 1;
  int lvl = 1;
 
  void display(){
    image(SCLVL,x, y, width/8, height/5);
  }

  void moveRight() {
    x += (speed * upgrade);
  }

  void moveLeft() {
    x -= (speed * upgrade);
  }

  void moveUp() {
    if (y <= 0 + (height/15)){
    } else{
      y -= (speed * upgrade);
    }
  }

  void moveDown() {
    if (y >= (height - height/15)){
    } else{
      y += (speed * upgrade);
    }
  }

  void upgrade() {
    if (lvl < 3){
      lvl += 1;
      SCLVL =loadImage("Spacecraftlvl"+lvl+".png");
      upgrade += 0.2;
    }
  }
  void checkBorder(){
    if (x <= (0 - width/20)){
      x = (width + width/20);
    }
    if (x >= (width + 0.0001 + width/20)){
      x = (0 - width/20);
    }
  }
  void run(){
    ship.display();
    ship.checkBorder();
  }
}

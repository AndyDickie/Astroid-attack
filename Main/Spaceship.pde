
class Ship {
  int hp;
  float speed = (width/120);
  float x = width/2;
  float y = height/2;
  float upgrade = 1;

  void display() {
    rect(x, y, 100, 100);
  }

  void moveRight() {
    x += (speed * upgrade);
  }

  void moveLeft() {
    x -= (speed * upgrade);
  }

  void moveUp() {
    y -= (speed * upgrade);
  }

  void moveDown() {
    y += (speed * upgrade);
  }

  void upgrade() {
    upgrade += 0.5;
  }
}


class Ship{
  int hp;
  float speed, upgradespeed;
  float x, y;
  

  
  void display(){
    rect(x, y, 100, 100);
  }
  
  void moveRight(){
   x += speed; 
  }
  
  void moveLeft(){
    x -= speed;
  }
  void moveUp(){
    y -= speed;
  }
  
  void moveDown(){
    y += speed;
  }
  
}

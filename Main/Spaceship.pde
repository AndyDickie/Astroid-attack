
class Ship{
  int hp;
  float speed = (width/12);
  float x = width;
  float y = height;
  
  
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

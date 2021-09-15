
class Ship{
  int hp;
  float speed = (width/110);
  float x = width/2;
  float y = height/2;
  
  
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

class Astroid{
  PVector vel, startpos, heading, direction;
  float xpos, ypos;
  boolean onScreen = false;
  boolean offScreen = false;
  Astroid(){
    int r1 = int(random(2));
    int r2 = int(random(2));
    
    if (r1 == 0){
      xpos = random(-500, -50);
    } else {
      xpos = random(width + 50, width + 500);
    }
    if (r2 == 0){
      ypos = random(-500, -50);
    } else {
      ypos = random(height + 50, height + 500);
    }
    startpos = new PVector(xpos, ypos);
    heading = new PVector(random(300, width-300), random(200, height-200));
    direction = heading.sub(startpos);
    vel = direction.normalize();
    vel.mult(10);
  }
  
  void display(){
    circle(startpos.x, startpos.y, 100);
  }
  
  void update(){
    startpos.add(vel);
    checkBorders();
  }
  
  void checkBorders(){
    if (startpos.x >= 0 && startpos.x <= width && startpos.y >= 0 && startpos.y <= height){
      onScreen = true;
    }
    if ((startpos.x < 0 || startpos.x > width) && (startpos.y < 0 || startpos.y > height) && onScreen == true){
      offScreen = true;
      }
  }
}
  
  
  
  
  
  
  
  
  
  

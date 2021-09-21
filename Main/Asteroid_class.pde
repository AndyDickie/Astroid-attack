class Astroid {
  PVector vel, startpos, heading, direction;
  float xpos, ypos;
  boolean onScreen = false;
  boolean offScreen = false;
  boolean hit = false;
  Astroid() {
    int r1 = int(random(2));
    int r2 = int(random(2));
    int randomVel = int(random(5, 20));

    if (r1 == 0) {
      xpos = random(-500, -50);
    } else {
      xpos = random(width + 50, width + 500);
    }
    if (r2 == 0) {
      ypos = random(-500, -50);
    } else {
      ypos = random(height + 50, height + 500);
    }
    startpos = new PVector(xpos, ypos);
    heading = new PVector(random(300, width-300), random(200, height-200));
    direction = heading.sub(startpos);
    vel = direction.normalize();
    vel.mult(randomVel);
  }

  void display() {
    fill(200);
    circle(startpos.x, startpos.y, 100);
  }

  void update() {
    startpos.add(vel);
    checkBorders();
  }

  void checkBorders() {
    if (startpos.x >= 0 && startpos.x <= width && startpos.y >= 0 && startpos.y <= height) {
      onScreen = true;
    }
    if ((startpos.x < 0 || startpos.x > width) && (startpos.y < 0 || startpos.y > height) && onScreen == true) {
      offScreen = true;
    }
  }

  boolean hitDetect() {
    float vx = ship.x - width/16;
    float hx = ship.x + width/16;
    float ty = ship.y + height/10;
    float by = ship.y - height/10;
    if (startpos.x > vx && startpos.x < hx && startpos.y > by && startpos.y < ty) {
      return true;
    } else{
      return false;
    }
  }









}

class Button{
  float x, y, w, h;
  PImage pic;
  boolean show = true;
  
  Button(float x_, float y_, float w_, float h_, PImage pic_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    pic = pic_;
  }
  
  void display(){
    if (show){
      image(pic, x, y, w, h);
    }
  }
  
  boolean hasClicked(){
    if (mouseX > x - (w/2) && mouseX < x + (w/2) && mouseY > y - (h/2) && mouseY < y + (h/2) && show == true){
      return true;
    } else {
      return false;
    }
  }
}

void mousePressed(){
  if (menu.state == 1 && menu.start.hasClicked()){
    menu.state = 0;
    gameTime = true;
    time = (millis() - (pauseTime - time));
  }
  
  if (menu.state == 1 && menu.upgrade.hasClicked()){
    menu.state = 2;
  }
  
  if (menu.state == 1 && menu.control.hasClicked()){
    menu.state = 3;
  }
}

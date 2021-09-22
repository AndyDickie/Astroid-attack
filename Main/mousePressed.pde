void mousePressed(){
  if (menu.state == 1 && menu.start.hasClicked()){
    menu.state = 0;
    gameTime = true;
    time = (millis() - (pauseTime - time));
  }
  //menu.upgrade.hasClicked();
  //menu.control.hasClicked();
}

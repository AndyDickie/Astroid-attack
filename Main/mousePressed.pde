void mousePressed(){
  if (menu.state == 1 && menu.start.hasClicked()){
    menu.state = 0;
    gameTime = true;
  }
  //menu.upgrade.hasClicked();
  //menu.control.hasClicked();
}

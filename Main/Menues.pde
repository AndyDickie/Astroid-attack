class Menu {

  void homescreen() {
    Button start = new Button(width/2, height-(height/2), (width/3), (height/10), startbutton1);
    Button upgrade = new Button(width/2, height-height/2.7, width/3, height/10, startbutton2);
    Button control = new Button(width/2, height-height/4, width/5, height/12, startbutton3);
    start.show = true;
    upgrade.show = true;
    control.show = true;
    

    image(startup, width/2, height/2);
    image(shipstart, width/4, height/4, width/5, height/3);
    image(astroid, width-width/4, height/4, width/6, height/4);
    //image(startbutton1, width/2, height-height/2, width/3, height/10);
    //image(startbutton2, width/2, height-height/2.7, width/3, height/10);
    //image(startbutton3, width/2, height-height/4, width/5, height/12);
    start.display();
    upgrade.display();
    control.display();
    
    
  }
  
  
  void controls(){
  image(controlsback,width/2,height/2);
  image(startbutton3,width/2,height/6,width/2,height/6);
  image(controlsbuttons,width/2,height/2,width/2,height/2);

    
  }


  void upgrades() {
    image(upgradescreen, width/2, height/2); 
    image(startbutton2, width/2, height/4, width/3, height/8);
    image(level1, width/4, height-height/3, width/5, height/3);
    image(level2, width/2, height-height/3, width/5, height/3);
    image(level3, width-width/4, height-height/3, width/5, height/3);
  }





  void playscreen() {
    image(Background, width/2, height/2);
    controls();
    ship.run();
    checkTime();
    coinscount();
    astroidManager.run();
  }
}

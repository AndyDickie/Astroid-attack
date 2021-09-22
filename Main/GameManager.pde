

void game() {
  if (gameTime) {
    image(Background, width/2, height/2);
    ship.highscore++;
    controls();
    ship.run();
    checkTime();
    coinscount();
    astroidManager.run();
  }

  if (questionTime) {
    showQuestion();
  }
}

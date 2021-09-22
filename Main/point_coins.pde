int coins; 
int highscore;

void coinscount() {
  fill(255, 255, 0);
  textSize(50);
  image(Coinpic, width-width/12+75, height/10+4, width/22, height/14);
  text(coins, width-width/12, height/10);
}

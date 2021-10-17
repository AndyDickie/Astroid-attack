import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import de.bezier.data.sql.*; 
import de.bezier.data.sql.mapper.*; 
import controlP5.*; 
import java.security.*; 
import de.bezier.data.sql.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Main extends PApplet {








//variable 
PImage Background;
PImage SCLVL;
PImage Coinpic;
PImage startup;
PImage shipstart;
PImage astroid;
PImage upgradescreen;
PImage level1;
PImage level2;
PImage level3;
PImage controlsback;
PImage controlsbuttons;
Ship ship;
ArrayList<Question> list1 = new ArrayList<Question>();
Table table;
int id = 0;
int string = 1;
int ans = 2;
AstroidManager astroidManager;
Menu menu;

PFont f;
//Signing saltet gør det muligt at undgå rainbowtables, som typisk indeholder hash fra de mest almene passwords, 
//ved at lægge en unik string til af tilfældig valgte karakterer og symboler. 
String signingSalt = "QKSD%KLSOALNFIIL";
String userName, password;
boolean passMode = true;
ControlP5 cp5;
Textfield pass_field, username_field;
Bang show_password, create_user, login; 

//setup
public void setup() {
  background(0);
  f = createFont("Arial", 20);
  
  loadImages();
  loadObjects(5, "");
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  font = createFont("Skrift.vlw", 35);
  font2 = createFont("Skrift.vlw", 75);
  time = millis();
  refreshList();
  
  frameRate(60); 
  db = new SQLite(this, "test.sqlite" );
  cp5 = new ControlP5(this);
  db.connect();

  show_password = cp5.addBang("Show_Password").setPosition(width/2+110, height/2-80).setSize(80, 40);
  create_user = cp5.addBang("Create_User").setPosition(width/2+110, height/2-140).setSize(80, 40);
  login = cp5.addBang("Login").setPosition(width/2+110, height/2-200).setSize(80, 40);

  username_field = cp5.addTextfield("Username").setPosition(width/2-100, height/2-200).setSize(200, 40).setAutoClear(false).setFont(f);
  pass_field = cp5.addTextfield("Password").setPosition(width/2-100, height/2-140).setSize(200, 40).setAutoClear(false).setFont(f);
  pass_field.setPasswordMode(passMode);
}

//draw
public void draw() {
  textFont(f);
  menu.update();
}

class AstroidManager {
  ArrayList<Astroid> astroids = new ArrayList<Astroid>();
  int astroidCount = 1;
  int counter = 1;
  boolean hasAdded = false;

  public void spawnAsteroids() {
    for (int i = 0; i < astroidCount && astroids.size() < astroidCount+1; i++) {
      astroids.add(new Astroid());
    }
    if (astroids.size() == astroidCount + 1) {
      hasAdded = false;
    }
  }

  public void displayAsteroids() {
    if (astroids.size() != 0) {
      for (Astroid a : astroids) {
        a.display();
        a.update();
      }
    }
  }

  public void removeAsteroids() 
  {
    if (astroids.size() != 0) 
    {
      for (int i = astroids.size()-1; i >= 0; i--) 
      {
        Astroid b = astroids.get(i);
        if (b.hitDetect()) 
        {
          astroids.remove(b);
          ship.deductHp();
        }
        if (b.offScreen == true) 
        {
          astroids.remove(b);
          counter++;
        }
      }
    }
  }
  public void run() {
    spawnAsteroids();
    removeAsteroids();
    displayAsteroids();
    if (astroidCount < (6 + (ship.lvl * 2))) {
      if (counter % 5 == 0 && hasAdded == false) {
        hasAdded = true;
      }
      if (hasAdded == true) {
        counter = 1;
        hasAdded = false;
        astroidCount += 1;
      }
    }
  }
}
class Astroid 
{
  PVector vel, startpos, heading, direction;
  float xpos, ypos;
  boolean onScreen = false;
  boolean offScreen = false;
  boolean hit = false;
  
  Astroid() 
  {
    int r1 = PApplet.parseInt(random(2));
    int r2 = PApplet.parseInt(random(2));
    int randomVel = PApplet.parseInt(random(5, 15));

    if (r1 == 0) 
    {
      xpos = random(-500, -50);
    } else {
      xpos = random(width + 50, width + 500);
    }
    if (r2 == 0) 
    {
      ypos = random(-500, -50);
    } else 
    {
      ypos = random(height + 50, height + 500);
    }
    startpos = new PVector(xpos, ypos);
    heading = new PVector(random(300, width-300), random(200, height-200));
    direction = heading.sub(startpos);
    vel = direction.normalize();
    vel.mult(randomVel);
  }

  public void display() {
    noFill();
    noStroke();
    image(astroid, startpos.x, startpos.y, width/12, height/10);
    circle(startpos.x, startpos.y, 100);
  }

  public void update() {
    startpos.add(vel);
    checkBorders();
  }

  public void checkBorders() {
    if (startpos.x >= 0 && startpos.x <= width && startpos.y >= 0 && startpos.y <= height) {
      onScreen = true;
    }
    if ((startpos.x < 0 || startpos.x > width) && (startpos.y < 0 || startpos.y > height) && onScreen == true) {
      offScreen = true;
    }
  }

  public boolean hitDetect() {
    float vx = ship.x - width/16;
    float hx = ship.x + width/16;
    float ty = ship.y + height/10;
    float by = ship.y - height/10;
    if (startpos.x > vx && startpos.x < hx && startpos.y > by && startpos.y < ty) {
      return true;
    } else {
      return false;
    }
  }
}
class Button {
  float x, y, w, h;
  PImage pic;
  boolean show = true;

  Button(float x_, float y_, float w_, float h_, PImage pic_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    pic = pic_;
  }

  public void display() {
    if (show) {
      image(pic, x, y, w, h);
    }
  }

  public boolean hasClicked() {
    if (mouseX > x - (w/2) && mouseX < x + (w/2) && mouseY > y - (h/2) && mouseY < y + (h/2) && show == true) {
      return true;
    } else {
      return false;
    }
  }
}
public void loadImages(){
  Background = loadImage("Background.jpeg");
  SCLVL =loadImage("Spacecraftlvl1.png");
  Coinpic = loadImage("Coin.png");
  startup = loadImage("Startup.jpeg");
  shipstart = loadImage("Spacecraftlvl32.png");
  astroid = loadImage("Astroide.png");
  baggrund =loadImage("Spørgsmåls baggrund.jpeg");
  level1 = loadImage("Level1.png");
  level2 = loadImage("Level2.png");
  level3 = loadImage("Level3.png");
  upgradescreen = loadImage("upgrades background.jpeg");
  controlsback = loadImage("Controlsback.jpeg");
  controlsbuttons = loadImage("Controlspic.png");
}

public void loadObjects(int s, String user_){
  astroidManager = new AstroidManager();
  menu = new Menu(s, user_);
  ship = new Ship();
  list1 = new ArrayList<Question>();
  refreshList();
  time = millis();
}

public boolean login(String userName, String password) {
  //Inputtet fra brugeren bliver hashet og sammenlignet med den hashede adgangskode til brugeren i SQL filen
  //Funktionen returnerer en true eller false afhængig om koden og brugernavnet er korrekt
  password = hash(password);
  background(0);
  if (getUserName(userName) == "") {
    text("user does not exist", width/2, height/10);
    return false;
  }
  if (password.equals(getPassword(userName))) {
    println("login succesful");
    println("indtastet:" + password);
    println("koden er:" + getPassword(userName));
    return true;
  } else {
    println("indtastet:" + password);
    println("koden er:" + getPassword(userName));
    text("Wrong password", width/2, height/10);
    return false;
  }
}

public void displayButtons(){
  username_field.setVisible(true);
  pass_field.setVisible(true);
  login.setVisible(true);
  show_password.setVisible(true);
  create_user.setVisible(true);
}

//Funktionen for login knappen
public void Login() {
  userName = cp5.get(Textfield.class, "Username").getText();
  password = cp5.get(Textfield.class, "Password").getText();
  println(" textInput 1 = " + userName);
  println(" textInput 2 = " + password);
  println();
  if (login(userName, password)) {
    menu.user = getUserName(userName);
    username_field.setVisible(false);
    pass_field.setVisible(false);
    login.setVisible(false);
    show_password.setVisible(false);
    create_user.setVisible(false);
    menu.state = 1;
  }
}
//Funktionen kører når knappen "show password" trykkes
public void Show_Password() {
  if (passMode == true) {
    passMode = false;
    pass_field.setPasswordMode(passMode);
  } else {
    passMode = true;
    pass_field.setPasswordMode(passMode);
  }
}

//Funktionen kører når knappen "Create user" trykkes
public void Create_User() {
  userName = cp5.get(Textfield.class, "Username").getText();
  password = cp5.get(Textfield.class, "Password").getText();
  insert(userName, password);
}
class Menu {
  int state = 5;
  Button startScreen;
  Button upgradeScreen;
  Button controlScreen;
  Button backButton, logoutButton;
  Button level1Button, level2Button, level3Button;
  PImage startButton;
  PImage upgradeButton;
  PImage controlBotton;
  ControlP5 cp5;
  Textfield pass_field, username_field;
  Bang show_password, create_user, login; 
  String user;
  int highscore, globalHighscore;


  Menu(int screenState_, String user_) {
    state = screenState_;
    user = user_;
    startButton = loadImage("startup button1.png");
    upgradeButton = loadImage("startup button2.png");
    controlBotton = loadImage("startup button3.png");
    startScreen = new Button(width/2, height-(height/2), (width/3), (height/10), startButton);
    upgradeScreen = new Button(width/2, height-height/2.7f, width/3, height/10, upgradeButton);
    controlScreen = new Button(width/2, height-height/4, width/5, height/12, controlBotton);
    backButton = new Button(width/10, height/10, width/5, height/10, null); 
    logoutButton = new Button(width-width/10, height/10, width/5, height/10, null);
    level1Button = new Button(width/4, height-height/3, width/5, height/3, level1);
    level2Button = new Button(width/2, height-height/3, width/5, height/3, level2);
    level3Button = new Button(width-width/4, height-height/3, width/5, height/3, level3); 
  }
  
  public void update() {
    if (state == 0) {
      //return;
      //playscreen();
      game();
    }
    if (state == 1) {
      homescreen();
    }
    if (state == 2) {
      upgrades();
    }
    if (state == 3) {
      controlScreen();
    }
    if (state == 4) {
      gameOver();
    }
    if (state == 5) {
      loginScreen();
    }
  }

  public void homescreen() {
    startScreen.show = true;
    upgradeScreen.show = true;
    controlScreen.show = true;

    image(startup, width/2, height/2);
    image(shipstart, width/4, height/4, width/5, height/3);
    image(astroid, width-width/4, height/4, width/6, height/4);
    startScreen.display();
    upgradeScreen.display();
    controlScreen.display();
    textSize(50);
    text("Logout", width-width/10, height/10);
    textMode(LEFT);
    textSize(20);
    text(user+ " highscore: " + getHighscore(user), width/10, height/10);
    text("All time highscore: " + getGlobalHighscore(), width/10, height/10+50);
  }

  public void upgrades() {
    image(upgradescreen, width/2, height/2); 
    image(upgradeButton, width/2, height/4, width/3, height/8);
    level1Button.display();
    level2Button.display();
    level3Button.display();
    textSize(100);
    text("Back", width/10, height/10);
    fill(255, 255, 0);
    textSize(50);
    image(Coinpic, width-width/12+95, height/10+4, width/22, height/14);
    text(ship.coins, width-width/12, height/10);
    text("lvl 1: 0 coins     lvl 2: 100 coins      lvl 3: 200 coins", width/2, height-height/12);
  }

  public void controlScreen() {
    image(controlsback, width/2, height/2);
    image(controlBotton, width/2, height/6, width/2, height/6);
    image(controlsbuttons, width/2, height/2, width/2, height/2);
    textSize(100);
    text("Back", width/10, height/10);
    textSize(50);
    text("Go back to the start screen by pressing p", width/2, height-height/12);
  }

  public void game() {
    if (gameTime) {
      image(Background, width/2, height/2);
      fill(255, 255, 0);
      textSize(50);
      image(Coinpic, width-width/12+95, height/10+4, width/22, height/14);
      text(ship.coins, width-width/12, height/10);
      text(PApplet.parseInt(ship.highscore/10), width/12, height/10);
      textMode(LEFT);
      text("HP: " + PApplet.parseInt(ship.hp), width-width/12, height/6);
      textMode(CENTER);
      ship.highscore++;
      controls();
      ship.run();
      checkTime();
      //coinscount();
      astroidManager.run();
    }

    if (questionTime) {
      showQuestion();
    }
  }

  public void gameOver() {
    image(Background, width/2, height/2);
    textSize(50);
    text("Game over, you got " + ship.highscore/10 + " points", width/2, height/2);
    if (ship.highscore/10 > getHighscore(user)){
      insertHighscore(user, ship.highscore/10);
    }
    if (ship.deathTime + 3*1000 < millis()) {
      loadObjects(1, user);
      state = 1;
    }
  }

  public void loginScreen() {
    //Knapperne og tekstfelterne bliver aktive når dette menu state er aktiv, derfor bliver der ikke kørt noget særligt i funktionen
    textSize(50);
    text("Astroid Attack", width/2, height/2-260);
    }
}
Question currentQuestion;
float time, pauseTime;
boolean questionTime;
boolean gameTime;

public void refreshList() {
  table = loadTable("test.csv", "header");
  list1.clear();
  for (int i = 0; i < table.getRowCount(); i++) {
    Question q = new Question(table.getInt(i, id), table.getString(i, string), table.getString(i, ans));
    list1.add(q);
  }
}

public void pullQuestion() {
  if (list1.size() > 0) {
    int randomInt = PApplet.parseInt(random(list1.size()));
    Question s = list1.get(randomInt);
    list1.remove(randomInt);
    currentQuestion = s;
  }
}

public void checkTime() {
  if ((time + 15*1000) < millis()) {
    hasAnswered = false;
    questionTime = true;
    gameTime = false;
    pullQuestion();
    currentQuestion.printspg();
  }
}

public void showQuestion() {
  if (hasAnswered == false) {
    displayQuestion();
  }
  if (hasAnswered == true) {
    currentQuestion.checkAnswer();
    time = millis();
    questionTime = false;
    gameTime = true;
    hasAnswered = false;
  }
}
String userPassword;
IntList highscores = new IntList();

SQLite db;

//Opretter en bruger
public void insert(String userName, String password) {
  password = hash(password);
  db.query("INSERT INTO users VALUES (null, '"+ userName + "', '"+ password + "', null)");
}

//Trækker password fra brugeren i sql filen (passwordet er gemt som hashet form)
public String getPassword(String userName) {
  db.query("SELECT password FROM users WHERE userName='"+ userName + "'");
  userPassword = db.getString("password");
  return userPassword;
}

//Returnerer en string med brugernavnet hvis denne bruger findes
public String getUserName(String userName) {
  db.query("SELECT userName FROM users WHERE userName='"+ userName + "'");
  String username = db.getString("userName");
  if (username != null) {
    return username;
  } else {
    return "";
  }
}

//Returnerer highscoren for en bruger
public int getHighscore(String userName){
  db.query("SELECT highscore FROM users where userName='"+ userName+ "'");
  return db.getInt("highscore");
}

//returnerer den højeste highscore
public int getGlobalHighscore(){
  db.query("SELECT highscore FROM users");
  while (db.next()){
    highscores.append(db.getInt("highscore"));
  }
  return highscores.max();
  
  //Dette er hvordan vi ville have gjort det, men af en eller anden grund virkede det aldrig..
  //db.query("SELECT MAX(highscore) FROM users");
  //return db.getInt("highscore");
  
}

//Indsætter highscore for en bruger
public void insertHighscore(String userName, int highscore){
  db.query("UPDATE users SET highscore="+ highscore +" WHERE userName='"+ userName + "'");
}

class Ship {
  int hp = 5;
  float speed = (width/175);
  float x = width/2;
  float y = height/2;
  float upgrade = 0.2f;
  int lvl = 1;
  int coins; 
  int highscore;
  int deathTime;
  
  public void display() {
    image(SCLVL, x, y, width/8, height/5);
  }

  public void moveRight() {
    x += (speed * (1 + (lvl * upgrade)));
  }

  public void moveLeft() {
    x -= (speed * (1 + (lvl * upgrade)));
  }

  public void moveUp() {
    if (y <= 0 + (height/15)) {
    } else {
      y -= (speed * (1 + (lvl * upgrade)));
    }
  }

  public void moveDown() {
    if (y >= (height - height/15)) {
    } else {
      y += (speed * (1 + (lvl * upgrade)));
    }
  }
  
  public void checkBorder() {
    if (x <= (0 - width/20)) {
      x = (width + width/20);
    }
    if (x >= (width + 0.001f + width/20)) {
      x = (0 - width/20);
    }
  }
  public void deductHp(){
    if (hp >= 2){
      hp -= 1;
    } else{
      deathTime = millis();
      menu.state = 4;
    }
  }
  
  public void run() {
    ship.display();
    ship.checkBorder();
  }
}
boolean w, s, a, d;
boolean upgradeFix = false;

public void keyPressed() {
  if (key == 'w' || key == 'W') {
    w = true;
    s = false;
  }
  if (key == 's'|| key == 'S') {
    w = false;
    s = true;
  }
  if (key == 'a'|| key == 'A') {
    d = false;
    a = true;
  }
  if (key == 'd'|| key == 'D') {
    d = true;
    a = false;
  }
  
  if (key == CODED) {
    if (keyCode == UP) {
      w = true;
      s = false;
    }
    if (keyCode == DOWN) {
      w = false;
      s = true;
    }
  
    if (keyCode == LEFT) {
      d = false;
      a = true;
    }
    if (keyCode == RIGHT) {
      d = true;
      a = false;
    }
  }

  if ((key == 'p' || key == 'P') && menu.state == 0) {
    menu.state = 1;
    gameTime = false;
    pauseTime = millis();
  }
}
public void keyReleased() {
  if (key == 'w'|| key == 'W') {
    w = false;
  }
  if (key == 's'|| key == 'S') {
    s = false;
  }

  if (key == 'a'|| key == 'A') {
    a = false;
  }
  if (key == 'd'|| key == 'D') {
    d = false;
  }
  
  if (key == CODED) {
    if (keyCode == UP) {
      w = false;
    }
    if (keyCode == DOWN) {
      s = false;
    }
  
    if (keyCode == LEFT) {
      a = false;
    }
    if (keyCode == RIGHT) {
      d = false;
    }
  }
}

public void mousePressed() {
  if (menu.state == 2 && menu.level2Button.hasClicked() && ship.coins >= 100 && upgradeFix == true){
    ship.lvl = 2;
    SCLVL =loadImage("Spacecraftlvl"+ship.lvl+".png");
    ship.coins -= 100;
  }
  
  if (menu.state == 2 && menu.level3Button.hasClicked() && ship.coins >= 200){
    ship.lvl = 3;
    SCLVL =loadImage("Spacecraftlvl"+ship.lvl+".png");
    ship.coins -= 200;
  }
  
  if (menu.state == 1 && menu.startScreen.hasClicked()) {
    menu.state = 0;
    gameTime = true;
    time = (millis() - (pauseTime - time));
  }
  
  if (menu.state == 1 && menu.upgradeScreen.hasClicked()) {
    menu.state = 2;
    upgradeFix = true;
  }

  if (menu.state == 1 && menu.controlScreen.hasClicked()) {
    menu.state = 3;
  }
  
  if ((menu.state == 2 || menu.state == 3) && menu.backButton.hasClicked()){
    menu.state = 1;
  }
  
  if (menu.state == 1 && menu.logoutButton.hasClicked()){
    background(0);
    displayButtons();
    username_field.setText("");
    pass_field.setText("");
    loadObjects(5, "");
  }
  
  
}

public void controls() {
  if (s) {
    ship.moveDown();
  }
  if (w) {
    ship.moveUp();
  }
  if (a) {
    ship.moveLeft();
  }
  if (d) {
    ship.moveRight();
  }
}
PFont font;
PFont font2;
String variablequestion;
PImage baggrund;
int value = 0;
boolean userAnswer;
boolean hasAnswered = false;

public void displayQuestion() {
  image(baggrund, width/2, height/2);
  stroke(255);
  strokeWeight(10);
  noFill();
  rect(width/2, height/4, 950, 300);
  fill(0, 255, 0);
  rect(width/3, height-height/3, 400, 400);
  fill(255, 0, 0);
  rect(width-width/3, height-height/3, 400, 400);
  fill(255);
  textFont(font);
  text(variablequestion, width/2, height/4);
  fill(0);
  textFont(font2);
  text("True", width/3, height-height/3);
  text("False", width-width/3, height-height/3);

  if (mousePressed) {
    if (mouseX>width/3-200&&mouseX<width/3+200&&mouseY>height-height/3-200&&mouseY<height-height/3+200) {
      //&&value==255
      userAnswer = true;
      hasAnswered = true;
      value=0;
    }
    if (mouseX>width-width/3-200&&mouseX<width-width/3+200&&mouseY>height-height/3-200&&mouseY<height-height/3+200) {
      userAnswer = false;
      hasAnswered = true;
      value=0;
    } else {
      return;
    }
  }
}
//Funktionen returnerer en hashet værdi af inputet samt signing saltet som en string
public String hash(String input) {
  try {
    MessageDigest md = MessageDigest.getInstance("SHA-256"); 
    String inputText = input + signingSalt;
    md.update(inputText.getBytes());    
    byte[] byteList = md.digest();

    StringBuffer hashedValueBuffer = new StringBuffer();
    for (byte b : byteList)hashedValueBuffer.append(hex(b)); 
    return hashedValueBuffer.toString();
  }
  catch (Exception e) {
    System.out.println("Exception: "+e);
  }
  return null;
}
class Question {
  boolean answer;
  String question;
  int id;
  boolean svar;
  Question(int id_, String questions_, String answer_) {
    question = questions_;
    id = id_;
    if (answer_.contains("true")) {
      answer = true;
    } else {
      answer = false;
    }
  }

  public void printspg() {
    //println(id, question, answer);
    variablequestion = question;
    //sæt variabel til question og svar og kør funktionen som tegner spørgsmål
  }

  public void checkAnswer() {
    //tjek for svar
    if (userAnswer == answer) {
      //println("korrekt");
      ship.coins += 25;
    } else {
      //println("forkert");
      //træk point fra eller liv?
    }
  }
}
  
  public void settings() {  fullScreen();  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Main" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

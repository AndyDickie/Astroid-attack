import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

import controlP5.*;
import java.security.*;
import de.bezier.data.sql.*;

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
void setup() {
  background(0);
  f = createFont("Arial", 20);
  fullScreen();
  loadImages();
  loadObjects(5, "");
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  font = createFont("Skrift.vlw", 35);
  font2 = createFont("Skrift.vlw", 75);
  time = millis();
  refreshList();
  smooth();
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
void draw() {
  textFont(f);
  menu.update();
}

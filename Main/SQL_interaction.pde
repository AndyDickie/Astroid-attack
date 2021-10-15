String userPassword;
IntList highscores = new IntList();

SQLite db;

//Opretter en bruger
void insert(String userName, String password) {
  password = hash(password);
  //db.connect();
  db.query("INSERT INTO users VALUES (null, '"+ userName + "', '"+ password + "', null)");
}

String getPassword(String userName) {
  //db.connect();
  db.query("SELECT password FROM users WHERE userName='"+ userName + "'");
  userPassword = db.getString("password");
  return userPassword;
}

String getUserName(String userName) {
  //db.connect();
  db.query("SELECT userName FROM users WHERE userName='"+ userName + "'");
  String username = db.getString("userName");
  if (username != null) {
    return username;
  } else {
    return "";
  }
}

int getHighscore(String userName){
  //db.connect();
  db.query("SELECT highscore FROM users where userName='"+ userName+ "'");
  return db.getInt("highscore");
}

int getGlobalHighscore(){
  //db.connect();
  db.query("SELECT highscore FROM users");
  while (db.next()){
    highscores.append(db.getInt("highscore"));
  }
  return highscores.max();
  //db.query("SELECT MAX(highscore) FROM users");
  //return db.getInt("highscore");
  
}

void insertHighscore(String userName, int highscore){
  //db.connect();
  db.query("UPDATE users SET highscore="+ highscore +" WHERE userName='"+ userName + "'");
}

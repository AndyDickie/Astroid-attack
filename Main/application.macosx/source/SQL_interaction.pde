String userPassword;
IntList highscores = new IntList();

SQLite db;

//Opretter en bruger
void insert(String userName, String password) {
  password = hash(password);
  db.query("INSERT INTO users VALUES (null, '"+ userName + "', '"+ password + "', null)");
}

//Trækker password fra brugeren i sql filen (passwordet er gemt som hashet form)
String getPassword(String userName) {
  db.query("SELECT password FROM users WHERE userName='"+ userName + "'");
  userPassword = db.getString("password");
  return userPassword;
}

//Returnerer en string med brugernavnet hvis denne bruger findes
String getUserName(String userName) {
  db.query("SELECT userName FROM users WHERE userName='"+ userName + "'");
  String username = db.getString("userName");
  if (username != null) {
    return username;
  } else {
    return "";
  }
}

//Returnerer highscoren for en bruger
int getHighscore(String userName){
  db.query("SELECT highscore FROM users where userName='"+ userName+ "'");
  return db.getInt("highscore");
}

//returnerer den højeste highscore
int getGlobalHighscore(){
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
void insertHighscore(String userName, int highscore){
  db.query("UPDATE users SET highscore="+ highscore +" WHERE userName='"+ userName + "'");
}

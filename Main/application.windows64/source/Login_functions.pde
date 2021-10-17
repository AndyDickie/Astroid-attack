
boolean login(String userName, String password) {
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

void displayButtons(){
  username_field.setVisible(true);
  pass_field.setVisible(true);
  login.setVisible(true);
  show_password.setVisible(true);
  create_user.setVisible(true);
}

//Funktionen for login knappen
void Login() {
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
void Show_Password() {
  if (passMode == true) {
    passMode = false;
    pass_field.setPasswordMode(passMode);
  } else {
    passMode = true;
    pass_field.setPasswordMode(passMode);
  }
}

//Funktionen kører når knappen "Create user" trykkes
void Create_User() {
  userName = cp5.get(Textfield.class, "Username").getText();
  password = cp5.get(Textfield.class, "Password").getText();
  insert(userName, password);
}

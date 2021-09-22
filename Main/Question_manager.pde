Question currentQuestion;
float time, pauseTime;
boolean questionTime;
boolean gameTime;

void refreshList() {
  table = loadTable("test.csv", "header");
  list1.clear();
  for (int i = 0; i < table.getRowCount(); i++) {
    Question q = new Question(table.getInt(i, id), table.getString(i, string), table.getString(i, ans));
    list1.add(q);
  }
}

void pullQuestion() {
  if (list1.size() > 0) {
    int randomtal = int(random(list1.size()));
    Question s = list1.get(randomtal);
    list1.remove(randomtal);
    currentQuestion = s;
  }
}

void checkTime() {
  if ((time + 3*1000) < millis()) {
    hasAnswered = false;
    questionTime = true;
    gameTime = false;
    pullQuestion();
    currentQuestion.printspg();
    ship.lvl++;
  }
}

void showQuestion() {
  if (hasAnswered == false) {
    displayQuestion();
  }
  if (hasAnswered == true) {
    ////println(userAnswer);
    //println(currentQuestion.answer);
    currentQuestion.tjekSvar();
    time = millis();
    questionTime = false;
    gameTime = true;
    hasAnswered = false;
  }
}

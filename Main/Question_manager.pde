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
    int randomInt = int(random(list1.size()));
    Question s = list1.get(randomInt);
    list1.remove(randomInt);
    currentQuestion = s;
  }
}

void checkTime() {
  if ((time + 15*1000) < millis()) {
    hasAnswered = false;
    questionTime = true;
    gameTime = false;
    pullQuestion();
    currentQuestion.printspg();
  }
}

void showQuestion() {
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

class Question {
  String question, answer;
  int id;
  boolean svar;
  Question(int id_, String questions_, String answer_) {
    question = questions_;
    id = id_;
    answer = answer_;
  }
  
  void printspg() {
    println(id, question, answer);
    variablequestion = question;
    //sæt variabel til question og svar og kør funktionen som tegner spørgsmål
  }

  void tjekSvar() {
    //tjek for svar
    if (userAnswer == answer){
      println("korrekt");
    } else {
      println("forkert");
      //træk point fra eller liv?
    }
  }    
}

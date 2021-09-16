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
    //sæt variabel til question og svar og kør funktionen som tegner spørgsmål
  }

  void tjekSvar() {
    //tjek for svar
    if ("input" == answer){
      //giv poínt
    } else {
      //træk point fra eller liv?
    }
  }    
}

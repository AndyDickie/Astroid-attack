PFont font;
PFont font2;
String variablequestion;
PImage baggrund;
int value = 0;
boolean userAnswer;
boolean hasAnswered = false;

void displayQuestion() {
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
    }
    else {
      return;
    }
  }
}

//void mouseReleased() {
//  if (value==0) {
//    value=255;
//  } else {
//    value=0;
//  }
//}

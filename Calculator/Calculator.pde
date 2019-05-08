Button[] btn = new Button[10];
Button[] opBtn = new Button[11];
String leftVal, rightVal, displayValue;
char opVal;
float result;
boolean firstNum, decFirst, decSecond;

void setup() {
  size(500, 500);
  btn[0] = new Button(60, 440, 80, 80).asNumber(0);
  btn[1] = new Button(60, 170, 80, 80).asNumber(1);
  btn[2] = new Button(150, 170, 80, 80).asNumber(2);
  btn[3] = new Button(240, 170, 80, 80).asNumber(3);
  btn[4] = new Button(60, 260, 80, 80).asNumber(4);
  btn[5] = new Button(150, 260, 80, 80).asNumber(5);
  btn[6] = new Button(240, 260, 80, 80).asNumber(6);
  btn[7] = new Button(60, 350, 80, 80).asNumber(7);
  btn[8] = new Button(150, 350, 80, 80).asNumber(8);
  btn[9] = new Button(240, 350, 80, 80).asNumber(9);

  opBtn[0] = new Button(350, 260, 80, 80).asOperator("x²");
  opBtn[1] = new Button(440, 170, 80, 80).asOperator("+");
  opBtn[2] = new Button(440, 80, 80, 80).asOperator("CLEAR");
  opBtn[3] = new Button(350, 170, 80, 80).asOperator("DEL");
  opBtn[4] = new Button(440, 260, 80, 80).asOperator("+/-");
  opBtn[5] = new Button(350, 350, 80, 80).asOperator("÷");
  opBtn[6] = new Button(440, 350, 80, 80).asOperator("-");
  opBtn[7] = new Button(350, 440, 80, 80).asOperator("×");
  opBtn[8] = new Button(440, 440, 80, 80).asOperator(".");
  opBtn[9] = new Button(195, 440, 170, 80).asOperator("ENTER");
  opBtn[10] = new Button(350, 80, 80, 80).asOperator("√");

  leftVal = "";
  rightVal = "";
  displayValue = "";
  opVal = ' ';
  result = 0.0;
  firstNum = true;
  decFirst = true;
  decSecond = true;
}
void keyPressed() {
  if (key == '0') {
    handleKeyPress(true, "0");
  } else if (key == '1') {
    handleKeyPress(true, "1");
  } else if (key == '2') {
    handleKeyPress(true, "2");
  } else if (key == '3') {
    handleKeyPress(true, "3");
  } else if (key == '4') {
    handleKeyPress(true, "4");
  } else if (key == '5') {
    handleKeyPress(true, "5");
  } else if (key == '6') {
    handleKeyPress(true, "6");
  } else if (key == '7') {
    handleKeyPress(true, "7");
  } else if (key == '8') {
    handleKeyPress(true, "8");
  } else if (key == '9') {
    handleKeyPress(true, "9");
  } else if (key == '-') {
    handleKeyPress(false, "-");
  } else if (key == '+') {
    handleKeyPress(false, "+");
  } else if (key == '*') {
    handleKeyPress(false, "*");
  } else if (key == '/') {
    handleKeyPress(false, "/");
  } else if (key == '=') {
    handleKeyPress(false, "=");
  } else if (keyCode == BACKSPACE) {
    handleKeyPress(false, "D");
  } else if (keyCode == ENTER) {
    handleKeyPress(false, "=");
  }
}
void handleKeyPress(boolean num, String val) {
  if (num) {
    if (firstNum) {
      leftVal += val;
      displayValue =leftVal;
    } else {
      rightVal += val;
      displayValue = rightVal;
    }
  } else {
    if (val.equals("-")) {
      opVal = '-';
      firstNum = false;
      displayValue = "-";
      rightVal = "";
    } else if (val.equals("+")) {
      opVal = '×';
      firstNum = false;
      rightVal = "";
      displayValue = "+";
    } else if (val.equals("/")) {
      opVal = '/';
      firstNum = false;
      rightVal = "";
      displayValue = "/";
    } else if (val.equals("*")) {
      opVal = '×';
      firstNum = false;
      rightVal = "";
      displayValue = "×";
    } else if (val.equals("=")) {
      performCalc();
    } else if (val.equals("D")) {
      if (firstNum) {
        if (leftVal.length() > 0) {
          leftVal = leftVal.substring(0, leftVal.length() - 1);
          displayValue = leftVal;
        }
      } else {
        if (leftVal.length() > 0) {
          rightVal = rightVal.substring(0, rightVal.length() - 1);
          displayValue = rightVal;
        }
      }
    }
  }
}
void draw() {
  background(230);
  fill(0);
  textAlign(CENTER);
  text("Calculator by Bryce Crouse", 250, 20);
  textAlign(LEFT);
  for (int i = 0; i <10; i++) {
    btn[i].display();
    btn[i].hover();
  }
  for (int i = 0; i <11; i++) {
    opBtn[i].display();
    opBtn[i].hover();
  }
  updateDisplay();
}
void updateDisplay() {
  fill(180);
  rect(150, 80, 260, 80);
  textAlign(RIGHT);
  fill(0);
  textSize(40);
  text(displayValue, 280, 90);
  textSize(15);
}
void mouseReleased() {
  for (int i = 0; i <10; i++) {
    if (btn[i].hover) {
      if (firstNum) {
        leftVal += str(btn[i].v);
        displayValue = leftVal;
      } else {
        rightVal += str(btn[i].v);
        displayValue = rightVal;
      }
    }
  }

  for (int i = 0; i <11; i++) {
    if (opBtn[i].hover) {
      if (opBtn[i].op == "+") {
        opVal = '+';
        firstNum = false;
        rightVal = "";

        displayValue = opBtn[i].op;
      } else if (opBtn[i].op == "-") {
        opVal = '-';
        firstNum = false;
        displayValue = opBtn[i].op;
        rightVal = "";
      } else if (opBtn[i].op == "×") {
        opVal = '×';
        firstNum = false;
        rightVal = "";
        displayValue = opBtn[i].op;
      } else if (opBtn[i].op == "÷") {
        opVal = '÷';
        firstNum = false;
        displayValue = opBtn[i].op;
        rightVal = "";
      } else if (opBtn[i].op == "x²") {
        if (firstNum) {
          leftVal = str(float(leftVal)*float(leftVal));
          displayValue= leftVal;
        } else {
          rightVal = str(float(rightVal)*float(rightVal));
          displayValue = rightVal;
        }

        //displayValue = str(sq(float(leftVal)));
        //firstNum = true;
        //leftVal = "";
      } else if (opBtn[i].op == "CLEAR") {
        displayValue = "";
        leftVal = "";
        rightVal = "";
        firstNum = true;
      } else if (opBtn[i].op == "+/-") {
        if (firstNum) {
          leftVal = str(-1.0*float(leftVal));
          displayValue = leftVal;
        } else {
          rightVal = str(-1.0*float(rightVal));
          displayValue = rightVal;
        }
      } else if (opBtn[i].op == ".") {

        if (checkDec()) {
          if (firstNum) {
            leftVal += ".";
            displayValue = leftVal;
          } else {
            rightVal += ".";
            displayValue = rightVal;
          }
        }
      } else if (opBtn[i].op == "√") {
        if (firstNum) {
          leftVal = str(sqrt(float(leftVal)));
          displayValue = leftVal;
        } else {
          leftVal = str(sqrt(float(rightVal)));
          displayValue = rightVal;
        }
      } else if (opBtn[i].op == "DEL") {
        if (firstNum) {
          if (leftVal.length() > 0) {
            leftVal = leftVal.substring(0, leftVal.length() - 1);
            displayValue = leftVal;
          }
        } else {
          if (leftVal.length() > 0) {
            rightVal = rightVal.substring(0, rightVal.length() - 1);
            displayValue = rightVal;
          }
        }
      }
      if (opBtn[i].op == "ENTER") {
        performCalc();
      }
    }
  }
}
boolean checkDec() {
  if (firstNum) {
    for (int i = 0; i < leftVal.length(); i++) {
      if (leftVal.substring(i, i+1).equals(".")) {
        return false;
      }
    }
  } else {
    for (int i = 0; i < rightVal.length(); i++) {
      if (rightVal.substring(i, i+1).equals(".")) {
        return false;
      }
    }
  }
  return true;
}
void performCalc() {
  if (opVal == '+') {
    result = float(leftVal) + float(rightVal);
    displayValue = str(result);
  }
  if (opVal == '-') {
    result = float(leftVal) - float(rightVal);
    displayValue = str(result);
  }
  if (opVal == '×') {
    result = float(leftVal) * float(rightVal);
    displayValue = str(result);
  }
  if (opVal == '÷') {
    result = float(leftVal) / float(rightVal);
    displayValue = str(result);
  }
  leftVal = displayValue;
  firstNum = true;
}

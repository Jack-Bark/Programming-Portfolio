// Jack Barklow | Nov 2022 | Calc Project
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0";
boolean left = true;
float l, r, result;
char op = ' ';

void setup() {
  size (320, 450);
  numButtons[0] = new Button(0, 330, 240, 60, '0', 180, 155);
  numButtons[1] = new Button(0, 270, 80, 60, '1', 180, 155);
  numButtons[2] = new Button(80, 270, 80, 60, '2', 180, 155);
  numButtons[3] = new Button(160, 270, 80, 60, '3', 180, 155);
  numButtons[4] = new Button(0, 210, 80, 60, '4', 180, 155);
  numButtons[5] = new Button(80, 210, 80, 60, '5', 180, 155);
  numButtons[6] = new Button(160, 210, 80, 60, '6', 180, 155);
  numButtons[7] = new Button(0, 150, 80, 60, '7', 180, 155);
  numButtons[8] = new Button(80, 150, 80, 60, '8', 180, 155);
  numButtons[9] = new Button(160, 150, 80, 60, '9', 180, 155);
  opButtons[0] = new Button(0, 90, 80, 60, 'c', 225, 200);
  opButtons[1] = new Button(160, 90, 80, 60, '.', 225, 200);
  opButtons[2] = new Button(240, 90, 80, 60, '+', #5DAEC9, #4F94AB);
  opButtons[3] = new Button(240, 150, 80, 60, '-', #5DAEC9, #4F94AB);
  opButtons[4] = new Button(240, 210, 80, 60, '×', #5DAEC9, #4F94AB);
  opButtons[5] = new Button(240, 270, 80, 60, '÷', #5DAEC9, #4F94AB);
  opButtons[6] = new Button(240, 330, 80, 60, '±', #5DAEC9, #4F94AB);
  opButtons[7] = new Button(240, 390, 80, 60, '=', #5DAEC9, #4F94AB);
  opButtons[8] = new Button(80, 90, 80, 60, 's', 225, 200);
  opButtons[9] = new Button(0, 390, 80, 60, '√', 225, 200);
  opButtons[10] = new Button(80, 390, 80, 60, 'π', 225, 200);
  opButtons[11] = new Button(160, 390, 80, 60, '%', 225, 200);
}

void draw () {
  strokeWeight(0);
  textSize(25);
  background(225);
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed () {
  println("key;" + key);
  println("keyCode:" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 106 || keyCode == 88) {
    handleEvent("×", false);
  } else if (keyCode == 47 || keyCode == 111) {
    handleEvent("÷", false);
  } else if (keyCode == 10 || keyCode == 61) {
    handleEvent("=", false);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  }
}

void handleEvent(String val, boolean num) {
  if (num  && dVal.length() < 18) {
    if (dVal.equals("0") || dVal.equals ("+") || dVal.equals ("-") || dVal.equals ("×") || dVal.equals ("÷")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("c")) {
    dVal = "0";
    left = true;
    l = 0.0;
    r = 0.0;
    result = 0.0;
    op = ' ';
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  } else if (val.equals("+")) {
    if (!dVal.contains("+")) {
      op = '+';
      dVal = "+";
      left= false;
    }
  } else if (val.equals("-")) {
    if (!dVal.contains("-")) {
      op = '-';
      dVal= "-";
      left = false;
    }
  } else if (val.equals("×")) {
    if (!dVal.contains("×")) {
      op = '×';
      dVal= "×";
      left = false;
    }
  } else if (val.equals("÷")) {
    if (!dVal.contains("÷")) {
      op = '÷';
      dVal= "÷";
      left = false;
    }
  } else if (val.equals("=")) {
    if (!dVal.contains("=")) {
      performCalculation();
    }
  } else if (val.equals("=")) {
    if (!dVal.contains("=")) {
      performCalculation();
    }
  }
  }

  void mouseReleased() {
    for (int i = 0; i<numButtons.length; i++) {
      if (numButtons[i].on ) {
        handleEvent(str(numButtons[i].val), true);
      }
    }

    for (int i = 0; i<opButtons.length; i++) {
      if (opButtons[i].on && opButtons[i].val == 'c') {
        handleEvent(str(opButtons[i].val), false);
      } else if (opButtons[i].on && opButtons[i].val == '+') {
        handleEvent("+", false);
      } else if (opButtons[i].on && opButtons[i].val == '-') {
        handleEvent("-", false);
      } else if (opButtons[i].on && opButtons[i].val == '×') {
        handleEvent("×", false);
      } else if (opButtons[i].on && opButtons[i].val == '÷') {
        handleEvent("÷", false);
      } else if (opButtons[i].on && opButtons[i].val == '±') {
        if (left) {
          l = l*-1;
          dVal = str(l);
        } else {
          r = r*-1;
          dVal = str(r);
        }
      } else if (opButtons[i].on && opButtons[i].val == '=') {
        handleEvent("=", false);
        performCalculation();
      } else if (opButtons[i].on && opButtons[i].val == 's') {
        if (left) {
          l = sq(l);
          dVal = str(l);
        } else {
          r = sq(r)
            ;
          dVal = str(r);
        }
      } else if (opButtons[i].on && opButtons[i].val == '√') {
        if (left) {
          l = sqrt(l);
          dVal = str(l);
        } else {
          r = sqrt(r)
            ;
          dVal = str(r);
        }
      } else if (opButtons[i].on && opButtons[i].val == 'π') {
        if (left) {
          l = PI;
          dVal = str(l);
        } else {
          r = PI;
          dVal = str(r);
        }
      } else if (opButtons[i].on && opButtons[i].val == '%') {
        if (left) {
          l = l*0.01;
          dVal = str(l);
        } else {
          r = r/l;
          dVal = str(r);
        }
      } else if (opButtons[i].on && opButtons[i].val == '.') {
        handleEvent(".", false);
      }
    }
    println(" l:" + l + " r:" + r + " op:" + op + " result:" + result + " left:" + left);
  }

  void updateDisplay() {
    if (dVal.length() < 12) {
      textSize(50);
    } else if (dVal.length() < 13) {
      textSize(47);
    } else if (dVal.length() < 14) {
      textSize(44);
    } else if (dVal.length() < 15) {
      textSize(41);
    } else if (dVal.length() < 16) {
      textSize(38);
    } else if (dVal.length() < 17) {
      textSize(35);
    }
    fill(#BFBFBF);
    rect(5, 5, width-10, 80, 5);
    fill(0);
    textAlign(RIGHT);
    text(dVal, width-20, 65);
  }

  void performCalculation() {
    if (op == '+') {
      result = l + r;
    } else if (op == '-') {
      result = l - r;
    } else if (op == '×') {
      result = l * r;
    } else if (op == '÷') {
      result = l / r;
    }
    dVal = str(result);
  }

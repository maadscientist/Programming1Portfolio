class Button {
  //Member Variables
  int x, y, w, h, v, round;
  String op;
  color c;
  boolean hover, num;
  //Multiple Constructor
  Button( int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    hover = false;
    this.op = op;
  }
  Button asNumber(int v) {
    this.v = v;
    num = true;
    return this;
  }
  Button asOperator(String op) {
    this.op = op;
    num = false;
    return this;
  }
  //Display Method
  void display() {
    //numbers
    if (num) {    
      rectMode(CENTER);
      if (hover) {
        fill(190, 160, 120);
      } else {
        fill(210, 180, 140);
      }
      rect(x, y, w, h, 20);
      textSize(20);
      textAlign(CENTER, CENTER);
      fill(0);
      text(v, x, y);
    } 
    //operators
    else {
      rectMode(CENTER);
      //checks for enter button
      if (w == 170) {
        if (hover) {
          fill(235);
        } else {
          fill(255);
        }
        rect(x, y, w, h, 20);
        
      } else {
        if (hover) {
          fill(205, 130, 130);
        } else {
          fill(225, 150, 150);
        }
        rect(x, y, w, h);
      }
      textSize(20);

      textAlign(CENTER, CENTER);
      fill(0);
      text(op, x, y);
    }
  }
  //Hover Method
  void hover() {
    hover = mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2;
  }
}

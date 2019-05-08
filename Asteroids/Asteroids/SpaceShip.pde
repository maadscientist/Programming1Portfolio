class SpaceShip {
  //Member Variables
  int x, y, lives, h, base, storedX, storedY;
  //yPoint1, yPoint2, yPoint3, xPoint1, xPoint2, xPoint3
  float angle, ySpeed, xSpeed, yMidPoint, xMidPoint;
  boolean accelerating, alive;

  //Constructor
  SpaceShip(int x, int y) {
    this.x = x;
    this.y = y;
    accelerating = false;
    lives = 3;
    angle = PI/2;
    xSpeed = 0;
    ySpeed = 0;
    yMidPoint = width/2;
    xMidPoint = width/2;
  }


  //Display Method
  void display() {
    fill(0);
    stroke(255);
    strokeWeight(2);

    triangle(xMidPoint + 40.0*cos(angle), yMidPoint - 40*sin(angle), xMidPoint + 25*cos(-2.49809154479 + angle), yMidPoint - 25*sin(-2.49809154479 + angle), xMidPoint + 25*cos(2.49809154479 + angle), yMidPoint - 25*sin(2.49809154479 + angle));
  }
  //Behavior Methods
  void accelerate() {
    xSpeed += .5*cos(angle);
    ySpeed -= .5*sin(angle);
  }
  void move() {
    xMidPoint += xSpeed;
    yMidPoint += ySpeed;
    xSpeed = xSpeed*.97;
    ySpeed = ySpeed*.97;
    if (xMidPoint > 1040) {
      xMidPoint = -40;
    }
    if (yMidPoint > 1040) {
      yMidPoint = -40;
    }
    if (yMidPoint < -40) {
      yMidPoint = 1040;
    }
    if (xMidPoint < -40) {
      xMidPoint = 1040;
    }
  }
  void turn(boolean left) {
    if (left) {
      angle += PI/36;
    } else {
      angle -= PI/36;
    }
  }
}

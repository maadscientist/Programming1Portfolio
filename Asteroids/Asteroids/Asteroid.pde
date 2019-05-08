class Asteroid {
  //Member Variables
  float ySpeed, xSpeed, x, y;
  int  d, type;
  color c;
  boolean powerUp;
  //Constructor
  Asteroid(float ySpeed, float xSpeed, int type, float x, float y, boolean powerUp) {
    this.x = x; 
    this.ySpeed = ySpeed; 
    this.xSpeed = xSpeed;
    this.type = type;
    this.y = y;
    d = 30*type;
    this.powerUp = powerUp;
  }
  //type will determine the size of asteroid

  void move() {
    screenDetect();
    x += xSpeed;
    y -= ySpeed;
  }
  void display() {
    fill(0);
    stroke(255);
    strokeWeight(3);
    if (powerUp) {
      fill(255);
      ellipse(x, y, d, d);
      fill(0);
    } else {
      ellipse(x, y, d, d);
    }
  }
  void screenDetect() {
    //spawn it on opposite side if it goes over boundary
    if (x > 1040) {
      x = -40;
    }
    if (y > 1040) {
      y = -40;
    }
    if (y < -40) {
      y = 1040;
    }
    if (x < -40) {
      x = 1040;
    }
  }
}  

class EnemyShips {
  //Member Variables
  int x, y, r;
  float ySpeed, xSpeed;
  boolean alive;
  //Constructor
  EnemyShips(float ySpeed, float xSpeed, int r, int y, int x) {
    this.x = x; 
    this.ySpeed = ySpeed; 
    this.xSpeed = xSpeed;
    this.y = y;
    this.r = r;
  }
  void fire() {
    lasers.add(new Laser(x, y, random(2*PI), millis()));
  }
  void move() {
    y -= ySpeed;
    x += xSpeed;
    screenDetect();
  }
  void display() {
    quad(x-r, y-r, x+r, y-r, x+r, y+r, x-r, y+r);
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

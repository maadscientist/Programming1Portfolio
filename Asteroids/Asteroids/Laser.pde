class Laser {
  // Member Variables
  float angle, xSpeed, ySpeed, x, y;
  int startTime;
  
  //Constructor
  Laser(float x, float y, float angle, int startTime){
    this.startTime = startTime;
    this.x = x; 

    this.y = y;
    this.angle = angle;
  }
  //speed is 50
  void move() {

    x += cos(angle)*15;
    y -= sin(angle)*15;
    screenDetect();
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


  void display() {
    ellipse(x, y, 4, 4);
  }
}

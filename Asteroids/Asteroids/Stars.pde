class Stars {
  // Member Variables
  int x, y;

  //Constructor
  Stars(int x, int y) {
    this.x = x;
    this.y = y;
  }
  void display() {
    fill(255);
    ellipse(x, y, 1, 1);
  }
}

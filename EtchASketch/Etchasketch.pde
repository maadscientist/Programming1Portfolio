float x, y, z, b;
float angle;
void setup() {
  size(1000, 1000);
  frameRate(10);
  x = width/2;
  y = height/2;
  z = 144;
  angle = 0;

}

void draw() {
  background(255);
  stroke(0, 0, 100); 

  for (int i = 0; i < 120; i++) {
    drawShape(145, 150);
//    Draw Stuff Here
  }

  noLoop();
}
void mouseClicked() {
  saveFrame("frame-#####.png");
}
//void keyPressed() {
//  if (key == CODED) {
//    if (keyCode == UP) {
//      background(255);
//      x = 500;
//      y = 500;
//      z = random(30, 330);
//      //drawShape();
//    }
//  }
//}
void drawShape(float degree, int move) {
  for (int i = 0; i < 360; i++) {
    forward(move);
    turn(degree);
  }
}
void moveRight(int rep) {
  for (int i = 0; i<rep*10; i++) {
    point(x+i, y);
  }
  x = x+(10*rep);
}
void moveDown(int rep) {
  for (int i = 0; i<rep*10; i++) {
    point(x, y+i);
  }
  y = y+(10*rep);
}
void moveLeft(int rep) {
  for (int i = 0; i<rep*10; i++) {
    point(x-i, y);
  }
  x = x-(10*rep);
}
void moveUp(int rep) {
  for (int i = 0; i<rep*10; i++) {
    point(x, y-i);
  }
  y = y-(10*rep);
}
void moveUpRight(int rep) {

  for (int i = 0; i<rep*10; i++) {
    point(x+i, y-i);
  }
  y = y-(10*rep);
  x = x+(10*rep);
}
void moveUpLeft(int rep) {

  for (int i = 0; i<rep*10; i++) {
    point(x-i, y-i);
  }
  y = y-(10*rep);
  x = x-(10*rep);
}
void moveDownRight(int rep) {

  for (int i = 0; i<rep*10; i++) {
    point(x+i, y+i);
  }
  y = y+(10*rep);
  x = x+(10*rep);
}
void moveDownLeft(int rep) {

  for (int i = 0; i<rep*10; i++) {
    point(x-i, y+i);
  }
  y = y+(10*rep);
  x = x-(10*rep);
}

void turn(float w) {
  angle = (angle + w/180*PI) % (2*PI);
}
void forward(int rep)
{

  line(x, y, x + cos(angle)*rep, y + sin(angle)*rep);
  x = x + cos(angle)*rep;
  y = y + sin(angle)*rep;
}

// Bryce Crouse 12/3/18
// Asteroids
ArrayList<Laser> lasers;
ArrayList<EnemyShips> ufos;
ArrayList<Asteroid> asteroids;
ArrayList<Stars> stars;

SpaceShip testSpaceShip;
Timer timer;
Timer invulnTimer;
Timer ticTimer;
Table tResults;
TableRow tr1;

EnemyShips testEnemy;

boolean released;
int rockRate = 40000;
int score = 0;
int numOfAsteroids;
int lives;
boolean invulnerable;
boolean ticker;
boolean play;
int level = 1;
String ticText = "";
String name = "BRYCE";
import processing.sound.*;
SoundFile laser;
SoundFile explosion;

void setup() {
  size(1000, 1000);
  background(0);
  tResults = loadTable("results.csv", "header");
  testSpaceShip = new SpaceShip(500, 500);
  lasers = new ArrayList<Laser>();
  ufos = new ArrayList<EnemyShips>();
  released = true;
  asteroids = new ArrayList<Asteroid>();
  stars = new ArrayList<Stars>();
  laser = new SoundFile(this, "laser.wav");
  explosion = new SoundFile(this, "bangMedium.wav");
  invulnTimer = new Timer(2000);
  timer = new Timer(rockRate);
  ticTimer = new Timer(1000);
  timer.start();
  for (int i = 0; i < 3; i++) {
    asteroids.add(new Asteroid(random(-4, 4), random(-4, 4), 4, random(1000), random(1000), false));
  }
  for (int i = 0; i < 100; i++) {
    stars.add(new Stars(int(random(1000)), int(random(1000))));
  }
  lives = 3;
}
void draw() {
  if (play) {
    background(0);
    //level handling

    for (int i = 0; i < stars.size(); i++) {
      stars.get(i).display();
    }
    testSpaceShip.display();
    if (timer.isFinished()) {
      for (int i = 0; i < 3; i++) {

        asteroids.add(new Asteroid(random(-2, 2), random(-2, 2), 4, int(random(1000)), random(1000), false));
      }
      level++;
      ticText = "Level: " + level;
      rockRate *= .95;
      timer.changeRate(rockRate);
      ticker();

      timer.start();
    }
    for (int i = 0; i < lasers.size(); i++) {
      lasers.get(i).move();
      lasers.get(i).display();
      if (lasers.get(i).startTime < millis()-1200)
      {
        lasers.remove(i);
      }
    }
    if (invulnTimer.isFinished()) {
      invulnerable = false;
    }
    for (int i = asteroids.size() - 1; i >= 0; i--) {
      Asteroid a = (Asteroid) asteroids.get(i);
      asteroids.get(i).move();
      asteroids.get(i).display();
      //add collision detection
      if (dist(testSpaceShip.xMidPoint, testSpaceShip.yMidPoint, asteroids.get(i).x, asteroids.get(i).y) < asteroids.get(i).d/2 + 30) {
        if (!invulnerable) {
          if (lives < 2) {

            gameOver();
          } else {
            //spawns ship at center & starts invulerability timer

            lives--;
            testSpaceShip.xMidPoint = 500;
            testSpaceShip.yMidPoint = 500;
            testSpaceShip.ySpeed = 0;
            testSpaceShip.xSpeed = 0;
            testSpaceShip.angle = PI/2;
            invulnerable = true;
            invulnTimer.start();
          }
          explosion.play();
        }
      }
      //laser detection
      for (int j = lasers.size() - 1; j >= 0; j--) {
        //detect intersection
        Laser l = (Laser) lasers.get(j);
        if (dist(l.x, l.y, a.x, a.y) < a.d/2) {

          if (asteroids.get(i).type > 1) {
            asteroids.add(new Asteroid(asteroids.get(i).ySpeed*.8, asteroids.get(i).xSpeed*1.2, asteroids.get(i).type - 1, asteroids.get(i).x, asteroids.get(i).y, false));

            if (random(1) > .96) {
              //5% chance to spawn powerup
              asteroids.add(new Asteroid(asteroids.get(i).ySpeed*1.2, asteroids.get(i).xSpeed*.8, asteroids.get(i).type - 1, asteroids.get(i).x, asteroids.get(i).y, true));
            } else {
              asteroids.add(new Asteroid(asteroids.get(i).ySpeed*1.2, asteroids.get(i).xSpeed*.8, asteroids.get(i).type - 1, asteroids.get(i).x, asteroids.get(i).y, false));
            }
          }
          if (asteroids.get(i).powerUp) {
            lives++;
          }
          asteroids.remove(i);
          lasers.remove(j);
          score += 50;
          explosion.play();
        }
      }
    }

    for (int i = 0; i < ufos.size(); i++) {
      ufos.get(i).move();
      ufos.get(i).display();
    }
    //controls spaceship movement
    if (keyPressed) {
      if (key == 'w') {

        testSpaceShip.accelerate();
      }
      if (key == 'a') {
        testSpaceShip.turn(true);
      }
      if (key == 'd') {
        testSpaceShip.turn(false);
      }
    }
    testSpaceShip.move();
    updateDisplay();
  } else {
    startScreen();
  }
}
void keyPressed() {

  if (key == ' ') {
    if (released) {
      released = false;
      lasers.add(new Laser(testSpaceShip.xMidPoint, testSpaceShip.yMidPoint, testSpaceShip.angle, millis()));
      laser.play();
    }
  }
}
void keyReleased() {
  if (key == ' ') {
    released = true;
  }
}

void updateDisplay() {
  textSize(12);
  fill(255);
  text("lives: " + lives, 10, 20);
  text("level: " + level, 10, 30);
  if (!ticTimer.isFinished()) {
    textSize(20);
    text(ticText, width / 2, height / 2);
  }
  textSize(12);
}
void gameOver() {
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Game Over", 500, 500);
  TableRow newRow = tResults.addRow();
  //tResults.sort("SCORE");

  newRow.setString("NAME", name);
  newRow.setString("SCORE", str(score));
  newRow.setString("LEVEL", str(level));
  text("Score: " + score, 500, 530, 10);
  saveTable(tResults, "data/results.csv");

  tResults.sort("SCORE");
  //tr1 = tResults.getRow(tResults.getRowCount()-1);
  //text("High Score for " + name +": " +  tr1.getString("SCORE"), width/2, 600);
  noLoop();
  textAlign(LEFT);
  textSize(12);
}
void ticker() {
  ticTimer.start();
  //ticker = true;
  //if (ticTimer.isFinished()) {
  //  ticker = false;
  //}
}
void startScreen() {
  background(0);
  textAlign(CENTER);
  //tResults.sort("SCORE");
  text("Asteroids Game by Bryce Crouse", width/2, 300);
  text("use A & D to turn left and right", width/2, 320);
  text("use W to accelerate and space to shoot", width/2, 340);
  text("white asteroids increase your lives", width/2, 360);
  text("click to continue", width/2, 380);
  tr1 = tResults.getRow(tResults.getRowCount() -1);
  //text("High Score: " + tr1.getString("SCORE") + " by: " + tr1.getString("NAME"), width/2, 400);
  textAlign(LEFT);

  if (mousePressed) {
    play = true;
  }
}

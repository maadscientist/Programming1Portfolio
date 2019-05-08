class Timer {
  int savedTime;
  int totalTime; 
  int passedTime;
  Timer(int totalTime) {
    this.totalTime = totalTime;
  }

  void start() {
    savedTime = millis();
  }
  void changeRate(int newRate){
    totalTime = newRate;
    
  }
  boolean isFinished() { 
    passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}

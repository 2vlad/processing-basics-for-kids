class Ball {
  float x, y, speedX, speedY;
  float d;
  Ball() {
    x = 600;
    y = 400;
    speedX = random(10, 15);
    speedY = random(10, 15);
    d = 20;
  }
  void display() {
    fill(#F0E91F);
    ellipse(x, y, d, d);
    move();
  }
  void move() {
    x += speedX;
    y += speedY;
    if (y > height || y < 0) {
      speedY *= -multiply;
    }
    //if (x > width || x < 0) {
    //  speedX *= -multiply;
    //}
  }
}

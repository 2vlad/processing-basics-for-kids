class Ball {
  float x, y, speedX, speedY;
  float d;
  Ball() {
    x = width/2;
    y = height/2;
    speedX = random(10, 15);
    speedY = random(10, 15);
    d = 50;
  }
  void display() {
    fill(#F0E91F);
    ellipse(x, y, d, d);
    move();
  }
  void move() {
    x += speedX;
    y += speedY;
    if(y > height || y < 0){
      speedY *= -1;
    }
    if(x > width || x < 0){
      speedX *= -1;
    }
  }
}

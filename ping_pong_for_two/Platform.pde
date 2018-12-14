class Platform1 {
  float x, y, d, h, speed;
  Platform1() {
    x = 0;
    y = 20;
    d = 50;
    h = 200;
    speed = 10;
  }
  void display() {
    fill(#E896CD);
    rect(x, y, d, h);
    move();
    check();
  }
  void move() {
    if (keyPressed == true && key == 'w') {
      y -= speed;
    }
    if (keyPressed == true && key == 's') {
      y += speed;
    }
  }
  void check() {
    if (pong.x - pong.d/2 < x + d && pong.y - pong.d/2 > y && pong.y + pong.d/2 < y + h) {
      println("!!!!!");
      pong.speedX *= -1;
      pong.speedY *= -1;
    }
  }
}

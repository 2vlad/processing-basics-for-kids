class Platform2 {
  float x, y, d, h, speed;
  Platform2() {
    d = 50;
    x = 1150;
    y = 20;
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
    //if (keyPressed == true && key == 'o') {
    //  y -= speed;
    //}
    //if (keyPressed == true && key == 'l') {
    //  y += speed;
    //}
    for (int i = 0; i < command_keys.length; i++) {
      if (keys_pressed[i]) {
        switch (command_keys[i]) {
        case 'o':
          y -= speed;
          break;
        case 'l':
          y += speed;
          break;
        }
      }
    }
  }
  void check() {
    if (pong.x + pong.d/2 > x && pong.y - pong.d/2 > y && pong.y + pong.d/2 < y + h) {
      println("!!!!!");
      pong.speedX *= -multiply;
      pong.speedY *= -multiply;
    }
  }
}

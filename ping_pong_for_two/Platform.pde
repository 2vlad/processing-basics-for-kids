class Platform1 {
  float x, y, d, h, speed;
  Platform1() {
    x = 0;
    y = 20;
    d = 20;
    h = 150;
    speed = 15;
  }
  void display() {
    fill(#E896CD);
    rect(x, y, d, h);
    move();
    check();
  }
  void move() {
    //if (keyPressed == true && key == 'w') {
    //  y -= speed;
    //}
    //if (keyPressed == true && key == 's') {
    //  y += speed;
    //}
    for (int i = 0; i < command_keys.length; i++) {
      if (keys_pressed[i]) {
        switch (command_keys[i]) {
        case 'w':
          y -= speed;
          break;
        case 's':
          y += speed;
          break;
        }
      }
    }
  }
  void check() {
    if (pong.x - pong.d/2 < x + d && pong.y - pong.d/2 > y && pong.y + pong.d/2 < y + h) {
      println("!!!!!");
      pong.speedX *= -multiply;
      pong.speedY *= -multiply;
    }
  }
}

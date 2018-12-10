class Flappy {
  float x, y, speed, g, d;
  Flappy() {
    x = 400;
    y = 400;
    d = 50;
    speed = 10;
  }
  void display() {
    drawSprite(hero, x, y, d);
    move();
    checkHit();
  }
  void move() {
    y += speed/4;
    if (keyPressed == true && key == ' ') {
      y -= speed*2;
    }
  }
}

void checkHit() {
  for (int i = 0; i < tube.size(); i++) {
    Pipe p = tube.get(i);
    float d = dist(p.x, p.y, bird.x, bird.y);
    if (d < sqrt( sq(p.h/4) + sq(p.h/2) ) ) {
      noLoop();
    }
  }
  if (bird.y + bird.d > ground) {
    noLoop();
  }
}

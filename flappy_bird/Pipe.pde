class Pipe {
  float x, y, h, speed;
  Pipe(int coin) {
    x = random(width - 200, width + 800);
    h = random(170, 330);
    y = ground - h/2;
    speed = 3;
  }
  void display() {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(x, y, h/2, h);
    x -= speed;
  }
}

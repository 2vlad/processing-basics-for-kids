class Enemy {
  // координаты, скорость, размер
  float x, y;
  float speed;
  float d;
  Enemy(float xs, float ys) {
    d = 40;
    speed = 5;
    x = xs;
    y = ys;
  }
  void display() {
    // вызывваем функцию отрисовки и движения
    //в отрисовку передаем спрайт, координаты для отрисовки, размер изображения
    drawSprite(roger, x, y, d);
    move();
    check();
  }
  void move() {
    //само движением и отражение от стены
    x += speed;
    if (x + d > width || x + d < 0) {
      y += d/2;
      speed = - speed;
    }
  }
  void check() {
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      for (int j = 0; j < enemies.size(); j++) {
        Enemy e = enemies.get(j);
        float dist = dist(b.x, b.y, e.x, e.y);
        if (dist < sqrt(2)*d) {
          score++;
          bullets.remove(i);
          enemies.remove(j);
          break;
        }
      }
    }
    for (int j = 0; j < enemies.size(); j++) {
      Enemy e = enemies.get(j);
      if (e.y > edem.y) {
        edem.alive = 0;
      }
    }
    if(enemies.size() == 0){
        println("!!!!");
      edem.alive = 2;
      }
  }
}
void createArmy() {
  float xs = 40;
  float ys = 40;
  int rows = 1;
  int cols = 1
  ;
  float d = 50;
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      enemies.add(new Enemy(xs, ys));
      xs += d;
    }
    xs -= d*cols;
    ys += d;
  }
}

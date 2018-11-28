class Stars {
  float x, y;
  float d, speed;
  Stars() {
//звезды появляются в случайном месте по всему экрану, имеют маленький случайный диаметр, случайную скорость
    x = random(0, width);
    y = random(0, height);
    d = random(0, 2);
    speed = random(2, 10);
  }
  void display() {
    fill(255);
    ellipse(x, y, d, d);
    x += speed;
    if (x > width) {
 // после достижения конца экрана создаем их заново, но уже в начале экрана
      x = 0;
      y = random(0, height);
      d = random(0, 2);
      speed = random(2, 10);
    }
  }
}

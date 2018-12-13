class Duck{
  float x, y, speed, d;
  Duck(){
    x = random(-200, 0);
    y = random(0, height - 100);
    speed = random(5, 10);
    d = 100;
  }
  void display(){
    image(duck, x, y, d, d);
    x += speed;
  }
}

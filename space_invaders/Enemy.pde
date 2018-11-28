class Enemy{
// координаты, скорость, размер
  float x, y;
  float speed;
  float d;
  Enemy(){
    d = 40;
    speed = 10;
    x = random(d, width);
    y = random(d, height/2);
  }
  void display(){
// вызывваем функцию отрисовки и движения
//в отрисовку передаем спрайт, координаты для отрисовки, размер изображения
    drawSprite(roger, x, y, d);
    move();
  }
  void move(){
//само движением и отражение от стены
  x += speed;
  if(x + d > width || x + d < 0){
    y += d;
    speed = - speed;
  }
  }
}

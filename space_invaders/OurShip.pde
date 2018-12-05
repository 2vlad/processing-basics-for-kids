class OurShip{
// координаты, скорость, размер
  float x, y;
  float speed;
  float d;
// таймер нужен чтобы не стрелять без перерыва
  float timer;
  OurShip(){
//спаунимся по середине экрана, чуть выше низа
  x = width/2;
  y = height - 100;
  speed = 10;
  d = 40;
  timer = 0;
  }
  void display(){
//отрисовываем нас и вызываем функцию движения
    drawSprite(ship, x, y, d);
    move();
    timer++;
  }
  void move(){
    if(keyPressed == true && key =='d'){
    x += speed;
    }
    if(keyPressed == true && key =='a'){
    x -= speed;
    }
    // стрельба по нажатию пробела и если таймер позволяет
    if(keyPressed == true && key ==' ' && timer >= 30){
    bullets.add(new Bullet(x, y));
    timer = 0;
    }
  }
}

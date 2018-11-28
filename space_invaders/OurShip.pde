class OurShip{
// координаты, скорость, размер
  float x, y;
  float speed;
  float d;
  OurShip(){
//спаунимся по середине экрана, чуть выше низа
  x = width/2;
  y = height - 100;
  speed = 10;
  d = 40;
  }
  void display(){
//отрисовываем нас и вызываем функцию движения
    drawSprite(ship, x, y, d);
    move();
  }
  void move(){
    if(keyPressed == true && key =='d'){
    x += speed;
    }
    if(keyPressed == true && key =='a'){
    x -= speed;
    }
  }
}

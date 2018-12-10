class OurShip{
// координаты, скорость, размер
  float x, y;
  float speed;
  float d;
  int alive;
// таймер нужен чтобы не стрелять без перерыва
  float timer;
  OurShip(){
//спаунимся по середине экрана, чуть выше низа
  x = width/2;
  y = height - 100;
  speed = 10;
  d = 40;
  timer = 0;
  alive = 1;
  }
  void display(){
//отрисовываем нас и вызываем функцию движения
    drawSprite(ship, x, y, d);
    move();
    timer++;
    if(alive == 0){
      for(int i = 0; i < roger.length; i++){
        for( int j = 0; j < roger[i].length; j++){
          roger[i][j] = 0;
        }
      }
    //background(0);
    textSize(80);
    text("You lose!", width/2-150, height/2);
    noLoop();
    }
    if(alive == 2){
    //background(0);
    textSize(80);
    text("You win!!!", width/2-150, height/2);
    textSize(30);
    text("Your score is:",width/2 - 150, height/2 + 100);
    text(s, width/2 + 50, height/2 + 100);
    noLoop();
    }
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

/* *************************
*
*1.  Поворот спрайта реализова через изменение 
     точки начала координат + поворот относительно этой точки.
       >> translate(x, y);
       >> rotate(HALF_PI/5); – угол в радианах
 
     Переменная «x» изменяется относительно стандартной системы координат.
     Реализоано через «запоминание» стандартной системы координат.
       >> pushMatrix(); — запоминаем стандарнтую систему координат
       >> както изменяем систему координат
       >> popMatrix(); — восстанавливаем стандарнтую систему координат
*
*2.  Анимация реализована массивом из трёх спрайтов. Индекс элемента
     зависит от времени – функция flap().
*
*************************** */

class Bird {
  PImage[] flap = new PImage[3];
  float x, y; 
  float acceleration;

  int timer = millis(), delta = 200, i = 0;
  int w, h;


  Bird() {
    flap[0] = loadImage("sprites/bluebird-downflap.png");
    flap[1] = loadImage("sprites/bluebird-midflap.png");
    flap[2] = loadImage("sprites/bluebird-upflap.png");

    // sprite width & height
    w = flap[0].width;
    h = flap[0].height;

    x = width / 4;
    y = height / 4;
    acceleration = 0;
  }

  void makeFlyAndJump() {
    pushMatrix();
    control();
    display();
    flap();
    gravity();
    popMatrix();
  }


  void control() {
    if (keyPressed) {
      jmp();
    } else {
      down();
    }
  }

  void jmp() {
    translate(x, y);
    rotate(- HALF_PI/5);
    acceleration = 0;
    y -= 5;
  }

  void down() {
    translate(x, y);
    rotate(HALF_PI/3);
    acceleration += 0.2;
  }


  void display() {
    imageMode(CENTER);
    image(flap[i], 0, 0);
  }


  void flap() {
    if (millis() - timer > 100) {
      i++;
      timer = millis();
    }
    if (i == flap.length - 1) i =0;
  }


  void gravity() {
    y += acceleration;
  }
}

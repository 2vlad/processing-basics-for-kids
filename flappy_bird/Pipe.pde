/* *************************
*
*1.  Cпрайты подгоняются под размер окна. 
*
*2.  Трубы двигаются друг над другом на расстоянии «delta»
*
*3.  Для реализации нескольких объектов в Pipe() добавлен входной параметр
     «float pipeSpace»       
************************** */

class Pipe {
  PImage pipeUp, pipeDown;
  float x, y;
  int pipeWidth;
  int delta;
  int bottomBorder;

  Pipe(int btBrdr, float pipeSpace) {
    pipeUp = loadImage("sprites/pipe-green.png");
    pipeDown = loadImage("sprites/pipe-green.png");
    
    pipeWidth = pipeUp.width;
    pipeUp.resize(pipeWidth, height);
    pipeDown.resize(pipeWidth, height);

    x = width + pipeSpace;
    bottomBorder = btBrdr;
    y = random(height / 5, bottomBorder);
    delta = 100;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    image(pipeDown, 0, 0);
    rotate(PI);
    image(pipeUp, - pipeWidth, delta);
    move();
    popMatrix();
  }

  void move() {
    x -= 1;
    if (x < - pipeWidth) {
      x = width;
       y = random(height / 5, bottomBorder);
    }
  }
}

/* *************************
*
*1. Функция «birdTouchCheck» принимает три объекта - птицу, фон + 
*   массив из труб. 
*
************************** */

void gameOver() {
  PImage end;
  float x, y;
  end = loadImage("sprites/gameover.png");
  x = width / 2;
  y = height /2;

  image(end, x, y);
}


void birdTouchCheck(Bird bird, Bground background, Pipe[] pipe) {
  // Проверка на касание земли
  if (bird.y >= background.y) {
    gameOver();
    noLoop();
  }

  // В цикле проверка на прикосновение к трубам.
  for (int i = 0; i < pipe.length; i++) {
    if (bird.y > pipe[i].y || bird.y < pipe[i].y - pipe[i].delta) {
      if (bird.x >= pipe[i].x && bird.x <= pipe[i].x + pipe[i].pipeWidth) {
        gameOver();
        noLoop();
      }
    }
  }
}

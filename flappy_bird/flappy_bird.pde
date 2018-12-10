Flappy bird = new Flappy();
ArrayList<Pipe> tube = new ArrayList<Pipe>();
float ground = 700;


void setup() {
  size(800, 800);
  noStroke();
}

void draw() {
  background(255);
  fill(0, 255, 0);
  rectMode(CENTER);
  rect(width/2, ground + (height - ground)/2, width, height - ground);
  bird.display();
  checkPipes();
  for (int i = 0; i < tube.size(); i++) {
    Pipe p = tube.get(i);
    p.display();
  }
}

void drawSprite(int[][] sprite, float x0, float y0, float d) {
  noStroke();
  // x, y - текущее положение "кисти", со значком 0 - начальное положение ряда/колонки, к которому надо возвращаться
  float x = x0;
  float y = y0;
  // высота одного квадратика считается как размер картинки/количество рядов
  float h = d/sprite.length;
  for (int i = 0; i < sprite.length; i++) {
    //ширина одного квадратика - ширина картинки на количество элементов в ряду
    float w = d/sprite[i].length;
    for (int j = 0; j < sprite[i].length; j++) {
      // если 0 - то рисуем квадратик белый, 1 - зеленый, 2 - ярко-зеленый
      if (sprite[i][j] == 0) {
        fill(255);
      }
      if (sprite[i][j] == 1) {
        fill(0);
      }
      //yellow
      if (sprite[i][j] == 2) {
        fill(#F2F21D);
      }
      //red
      if (sprite[i][j] == 3) {
        fill(#F2281D);
      }
      //soft yellow
      if (sprite[i][j] == 4) {
        fill(#F6FF03);
      }
      rect(x, y, h, w);
      x += w;
    }
    x = x0;
    y += h;
  }
}

void checkPipes() {
  if (tube.size() < 3) {
    int coin = (int) random(1, 3);
    tube.add(new Pipe(coin));
  }
  for (int i = 0; i < tube.size(); i++) {
    Pipe p = tube.get(i);
    if (p.x < -50) {
      tube.remove(i);
    }
  }
}

/* *************************
*
*1. Cпрайты подгоняются под размер окна.
*
*2. Нижняя часть анимирована массивом из двух одинаковых спрайтов.
*
************************** */

class Bground {
  PImage city;
  PImage[] grass = new PImage[2];
  int grassLength;
  int x, y, grassSpeed;

  Bground() {
    city = loadImage("sprites/background-day.png");
    city.resize(width, 0);

    grass[0] = grass[1] = loadImage("sprites/base.png");
    grass[0].resize(width, 0);
    grass[1].resize(width, 0);

    grassLength = grass[0].width;
    y = height - grass[0].height;
    x = 0;
    grassSpeed = 2;
  }

  void display() {
    imageMode(CORNER);
    image(city, 0, 0);
    grassMove();
  }

  void grassMove() {
    imageMode(CORNER);
    image(grass[0], x, y);
    image(grass[1], x + grassLength, y);
    x -= grassSpeed;
    if (abs(x) > grassLength) {
      x = 0;
    }
  }
}

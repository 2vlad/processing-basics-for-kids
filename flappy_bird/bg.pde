class Bground {
  PImage city;
  PImage[] grass = new PImage[2];
  int grassLength;
  int x, y;

  Bground() {
    city = loadImage("sprites/background-day.png");
    city.resize(width, 0);
    grass[0] = grass[1] = loadImage("sprites/base.png");
    grass[0].resize(width, 0);
    grass[1].resize(width, 0);
    grassLength = grass[0].width;
    x = 0;
    y = height - grass[0].height;
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
    x--;
    if (abs(x) > grassLength) {
      x = 0;
    }
  }
}

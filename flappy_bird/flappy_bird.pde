Bground bg;
Bird b;

PImage city;

void setup() {
  size(288, 512);
  bg = new Bground(); 
  b = new Bird();
  city = loadImage("sprites/background-day.png");
}

void draw() {
  background(255);
  image(city, width / 2, height / 2);
  bg.display();
  b.makeFlyAndJump();
}

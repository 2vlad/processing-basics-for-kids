PImage gun, duck, background;
Hero hunter = new Hero();
ArrayList <Duck> pack = new ArrayList <Duck>();

void setup() {
  size(1200, 800);
  background = loadImage("background.jpg");
  gun = loadImage("rifle1.png");
  duck = loadImage("duck1.png");
}


void draw() {
  image(background, 0, 0, width, height);
  createPack();
  hunter.display();
  for (int i = 0; i < pack.size(); i++) {
    Duck e = pack.get(i);
    e.display();
  }
}

void createPack() {
  if (pack.size() < 4) {
    pack.add(new Duck());
  }
  for (int i = 0; i < pack.size(); i++) {
    Duck e = pack.get(i);
    if (keyPressed == true) {
      if (hunter.x > e.x && hunter.x < e.x + e.d && hunter.y > e.y && hunter.y < e.y + e.d) {
        pack.remove(i);
      }
    }
  }
}

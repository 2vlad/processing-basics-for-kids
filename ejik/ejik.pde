PImage fon;
PImage ejik;

float x = 30, y = 0, vx = 5, vy = 5, h = 500, k = 0;

void setup() {
  size(600, 600); 
  fon = loadImage("fon.jpg");
  ejik = loadImage("ejik.png");
}

void draw() {  
  image(fon, 0, 0);
  image(ejik, x, y);

  if (y > 460) { 
    vy = -vy * 0.87;
  } else {
    vy = vy + 1;
  }
  if (y < -100) { 
    vy = -vy;
  }
  if (mousePressed) {
    vy = -10; 
    vx = 5;
  }
  
  y = y + vy;
}

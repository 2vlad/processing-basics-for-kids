class Bird {
  PImage[] flap = new PImage[3];
  float x, y, gravity;
  int timer = millis(), delta = 200, i = 0;

  Bird() {
    flap[0] = loadImage("sprites/bluebird-downflap.png");
    flap[1] = loadImage("sprites/bluebird-midflap.png");
    flap[2] = loadImage("sprites/bluebird-upflap.png");

    x = width / 4;
    y = height / 4;
    gravity = 0;
    
  }

  void makeFlyAndJump() {
    control();
    display();
    flap();
    gravity();
  }

  void display() {
    imageMode(CENTER);
    image(flap[i], 0, 0);
  }

  void control() {
    if (keyPressed) {
      jmp();
    } else {
      down();
    }
  }

  void flap() {
    if (millis() - timer > 100) {
      i++;
      timer = millis();
    }
    if (i == flap.length - 1) i =0;
  }

  void jmp() {
    translate(x, y);
    rotate(- HALF_PI/4.0);
    gravity = 0;
    y -= 5;
  }

  void down() {
    translate(x, y);
    rotate(HALF_PI/4.0);
    gravity += 0.2;
  }
  
  void gravity() {
    y += gravity;
  }
}

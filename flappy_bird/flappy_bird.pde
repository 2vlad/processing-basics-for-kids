Bground bg;
Pipe[] p = new Pipe[2];
Bird b;

void setup() {
  size(300, 600);
  bg = new Bground();
  p[0] = new Pipe(bg.y, 0);
  p[1] = new Pipe(bg.y, width / 1.6);
  b = new Bird();
}

void draw() {
  background(255);
  bg.display();  
  p[0].display();
  p[1].display();
  b.makeFlyAndJump();
  birdTouchCheck(b, bg, p);
}

void mousePressed() {
  loop();
  b.y = 0;
  b.acceleration = 0;
  p[0] = new Pipe(bg.y, 0);
  p[1] = new Pipe(bg.y, width / 1.6);
}

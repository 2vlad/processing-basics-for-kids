ArrayList<Star> galaxy;

boolean gameStart = false;

void startScreen() {
  background(0);
  flyingStarts();
  textAlign(CENTER);
  textSize(48);
  text("SPACE INVADERS", width / 2, height / 3);
  textSize(36);
  text("Keys: a - left, d - right", width / 2, height / 3 + 70);
  text("HIT <SPACE> for start", width / 2, height / 3 + 110);
  fill(#9BB8FF);
  text("Mayak.school", width / 2, height - 100);
}

void flyingStarts() {
  for (int i = 0; i < galaxy.size(); i ++) {
    Star s = galaxy.get(i);
    s.display();
    if (s.x > width) {
      galaxy.remove(i);
      galaxy.add(new Star());
    }
  }
}


class Star {
  float x, y, d, speed;
  
  Star() {
    x = random(0, width);
    y = random(0 , height);
    d = random(0, 5);
    speed = random(2, 10);
  }
  
  void display() {
    ellipse(x, y, d, d);
    x += speed;
  }
}

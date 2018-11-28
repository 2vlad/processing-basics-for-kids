class Cell {
  float x, y, w;
  boolean foodAdded = false;

  Cell(float xStart, float yStart) {
    x = xStart;
    y = yStart;
    w = cellWidth;

    if (random(1, 100) > 95) {
      foodAdded = true;
    }
  }

  void display() {
    fill(255);
    stroke(#0DBEFC);
    rectMode(CENTER);
    rect(x, y, w, w);
  }

  void drawFood() {
    if (foodAdded) {
      fill(#FC850D);
      noStroke();
      ellipse(x, y, w / 3, w / 3);
    }
  }
  
  
}

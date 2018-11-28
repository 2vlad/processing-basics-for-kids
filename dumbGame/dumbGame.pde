Cell[][] grid;
Cell c;
Pacman p;

int row, col;
float cellWidth;
float x, y;
int score;


void setup() {
  background(255);
  size(500, 500);
  createGridWithFood();
  p = new Pacman();
  score = 0;
}


void draw() {
  displayGridWithFood();
  p.display();
  eatingProcess();
  
  if (foodIsOver()) {
    createGridWithFood();
  }
}


void createGridWithFood() {
  cellWidth = 50;

  col = int(width / cellWidth);
  row = int(height / cellWidth);

  x = cellWidth / 2;
  y = cellWidth / 2;

  grid = new Cell[row][col];

  float xSave = x;

  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      grid[i][j] = new Cell(x, y);
      x += cellWidth;
    }
    x = xSave;
    y += cellWidth;
  }
}


void displayGridWithFood() {
  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      c = grid[i][j]; 
      c.display();
      c.drawFood();
    }
  }
}


void eatingProcess() {
  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      c = grid[i][j]; 
      if (c.x == p.x && c.y == p.y && c.foodAdded) {
        c.foodAdded = false;
        score ++;
      }
    }
  }
}


boolean foodIsOver() {
  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      c = grid[i][j]; 
      if (c.foodAdded) {
        return false;
      }
    }
  }
  return true;
} 

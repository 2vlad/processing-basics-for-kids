// Класс для описания корабля освободителей 

int numberOfLives;

class Guard {
  float x, y, spriteWidth, spriteHeight, speed;  
  int[][] spriteForDisplay;
  int row, col;
  int shotTimer = millis();

  Guard(float xCentre, float yCentre, int[][] sprite) {
    speed = 5;

    row = sprite.length;
    col = sprite[0].length;

    spriteHeight = row * widthSpritePixel;
    spriteWidth = col * widthSpritePixel;

    x = xCentre;
    y = yCentre;

    // Копирование полученного спрайта в объект
    spriteForDisplay = new int[row][col];
    for (int i = 0; i < row; i ++) {
      for (int j = 0; j < col; j ++) {
        spriteForDisplay[i][j] = sprite[i][j];
      }
    }
  }


  // Отрисовка корабля освободителей по коориднатам его центра
  void display() {
    drawSprite(x, y, spriteForDisplay);
  }


  // Управление кораблём освободителей 
  void control() {
    for (int i = 0; i < command_keys.length; i++) {
      if (keys_pressed[i]) {
        switch (command_keys[i]) {
        case 'a':
        case 'ф':
          x -= 5;
          break;
        case 'd':
        case 'в':
          x += 5;
          break;
        case ' ':
          bullets_ready = true;
          shot();
          break;
        }
      }
    }
  }


  // Создаём новую ракету каждые 300 мс
  void shot() {
    if (millis() - shotTimer > 500) {
      bullets.add(new Bullet(bender, b));
      shotTimer = millis();
    }
  }
}

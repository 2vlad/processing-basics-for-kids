// Класс для создания пуль и ракет
// Проверка на попадание ракет из корабля освободителя в пришельцев
// Провереяем всех ли пришельцев уничтожили


// >>Класс для создания пуль и ракет
class Bullet {
  float x, y, spriteWidth, spriteHeight;
  int[][] spriteForDisplay;

  Bullet (Guard other, int[][] sprite) {
    x = other.x;
    y = other.y - other.spriteHeight;

    int row = sprite.length;
    int col = sprite[0].length;

    // Рассчёт ширины и высоты спрайта
    spriteHeight = row * widthSpritePixel;
    spriteWidth = col * widthSpritePixel;

    // Копирование полученного спрайта в объект
    spriteForDisplay = new int[row][col];
    for (int i = 0; i < row; i ++) {
      for (int j = 0; j < col; j ++) {
        spriteForDisplay[i][j] = sprite[i][j];
      }
    }
  }

  Bullet (Invador other, int[][] sprite) {
    x = other.x;
    y = other.y + other.spriteHeight;

    int row = sprite.length;
    int col = sprite[0].length;

    // Рассчёт ширины и высоты спрайта
    spriteWidth = col * widthSpritePixel;
    spriteHeight = row * widthSpritePixel;

    // Копирование полученного спрайта в объект
    spriteForDisplay = new int[row][col];
    for (int i = 0; i < row; i ++) {
      for (int j = 0; j < col; j ++) {
        spriteForDisplay[i][j] = sprite[i][j];
      }
    }
  }

  // Отрисовка спрайта
  void display() {
    drawSprite(x, y, spriteForDisplay);
  }

  // Метод для полёта ракет из корабля освободителя
  void fly() {
    y -= 5;
  }

  // Метод для полёта пуль из пришельцев
  void invaderShoots() {
    y += 10;
  }
}


// >>Проверка на попадание ракет из корабля освободителя в пришельцев и в потолок
void hitCheck() {
  for (int i = 0; i < invadors.size(); i++) {
    Invador enemy = invadors.get(i);
    for (int j = 0; j < bullets.size(); j++) {
      Bullet bl = bullets.get(j);
      if (bl.x <= enemy.x + enemy.spriteWidth / 2 && bl.x >= enemy.x - enemy.spriteWidth / 2) {
        if (bl.y <= enemy.y + enemy.spriteHeight / 2 && bl.y >= enemy.y - enemy.spriteHeight / 2) {
          bullets.remove(j);
          // в момент столкновения нарисовать новый спрайт spriteExplosion с новым цветом
          fill(#FFF079);
          drawSprite(enemy.x, enemy.y, spriteExplosion);
          invadors.remove(i);
          counter ++;
          break;
        }
      }
    }
  }

  // Проверка на попадание пули в потолок
  for (int i = 0; i <bullets.size(); i++) {
    Bullet bl = bullets.get(i);
    if (bl.y <= bf.yTopBorder) {
      // в момент столкновения нарисовать новый спрайт bulletExplosion с новым цветом
      fill(#FF79C3);
      drawSprite(bl.x, bl.y, bulletExplosion);
      bullets.remove(i);
    }
  }
}


// >>Провереяем всех ли пришельцев уничтожили
boolean winCheck() {
  if (invadors.size() == 0) return true;
  return false;
}


// >> Проверка попадания пуль пришельцев в землю, корабль, защитную ракету
void invaderBulletsCheck() {
  for (int i = 0; i < invadorBullets.size(); i ++) {
    Bullet invBullet = invadorBullets.get(i);

    // Попадание в землю
    if (invBullet.y > bf.yBottomBorder) {

      // в момент столкновения нарисовать новый спрайт bulletExplosion с новым цветом
      fill(#8CFCC1);
      drawSprite(invBullet.x, invBullet.y, bulletExplosion);
      invadorBullets.remove(i);
      break;
    }

    // Попадание в корабль
    if (invBullet.x > (bender.x - bender.spriteWidth / 2) && invBullet.x < (bender.x + bender.spriteWidth / 2)) {
      if (invBullet.y >= (bender.y - bender.spriteHeight / 2)) {
        // в момент столкновения нарисовать новый спрайт с новым цветом
        fill(#FFF079);
        drawSprite(bender.x, bender.y, spriteExplosion);
        livesCounter.remove(numberOfLives - 1);
        numberOfLives --;
        invadorBullets.remove(i);
        break;
      }
    }

    // Попадание пули пришельца в защитную ракету освободителя
    for (int j = 0; j < bullets.size(); j++) {
      Bullet guardRocket = bullets.get(j);

      if (invBullet.x > (guardRocket.x - guardRocket.spriteWidth) && invBullet.x < (guardRocket.x + guardRocket.spriteWidth)) {
        if (invBullet.y >= (guardRocket.y - guardRocket.spriteHeight / 2)) {
          bullets.remove(j);
          // в момент столкновения нарисовать новый спрайт bulletToBullet с новым цветом
          fill(#FFFF8B);
          drawSprite(invBullet.x, invBullet.y, bulletToBullet);
          invadorBullets.remove(i);
          break;
        }
      }
    }
  }
}

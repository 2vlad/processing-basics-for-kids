// Класс для описания захватичиков
// Создание армии захватчиков
// Определние победы захватиков

float invador_attack_x_speed = 10;

// >>Класс для описания захватичков
class Invador {
  float invador_attack_x_direction = 1;
  float x, y, spriteWidth, spriteHeight;
  int row, col;
  boolean alive;
  int[][] spriteForDisplay;
  int shotTimer = millis();


  Invador(float xStart, float yStart, int[][] sprite) {
    row = sprite.length;
    col = sprite[0].length;

    spriteWidth = col * widthSpritePixel;
    spriteHeight = row * widthSpritePixel;

    x = xStart;
    y = yStart;

    // Копирование полученного спрайта в объект
    spriteForDisplay = new int[row][col];
    for (int i = 0; i < row; i ++) {
      for (int j = 0; j < col; j ++) {
        spriteForDisplay[i][j] = sprite[i][j];
      }
    }
    alive = true;
  }

  void display() {
    if (alive) {
      drawSprite(x, y, spriteForDisplay);
    }
  }

  void shot(Invador other) {
    if (millis() - shotTimer > 1000) {
      invadorBullets.add(new Bullet(other, invadorLightning));
      invadorHaveBullets = true;
      shotTimer = millis();
    }
  }
}


// >>Создание армии захватчиков
void invadorArmyCreate() {
  // Расстояние между захватичиками
  float step = widthSpritePixel * 20;

  // Стартовые координаты для рисования армии пришельцев
  float xS = bf.xLeftBorder;
  float yS = bf.yTopBorder + 15 * widthSpritePixel;

  // Рассчёт координат для каждого захватичика и добавление его в армию
  for (int j = 0; j < no_of_invadors_row; j++) {
    for (int i = 0; i < no_of_invadors_col; i ++) {
      if (j < 2) invadors.add(new Invador(xS, yS, roger)); 
      else invadors.add(new Invador(xS, yS, hans));
      xS += step;
    }
    xS = bf.xLeftBorder;
    yS += step / 1.2;
  }
}

// Отображение и создание пуль для захватичика
int stepTimer = millis();
int stepTimerDelay = 200;
void invadorArmyDisplay() {
  for (Invador enemy : invadors) {
    enemy.display();
    if (millis() - shotEnemyTimer > shotEnemyDelay) {
      enemy.shot(enemy);
      shotEnemyTimer = millis();
    }
  }
}

// >>Движение зизгазом
//   Если текущй захватчик касается стены, то сообщает об этом всей своей армии – 
//   каждый захватичик полчает 3 сообщения: 
//   1. Поверни в другую сторону
//   2. Обнови свою x координату
//   3. Увеличь свою y координату
void invadorArmyZigzagMove() {
  if (millis() - stepTimer > stepTimerDelay) {
    for (Invador enemyw : invadors) {
      if (enemyw.x > bf.xRightBorder || enemyw.x < bf.xLeftBorder) {
        for (Invador enemy : invadors) {
          enemy.invador_attack_x_direction *= -1;
          enemy.x += invador_attack_x_speed * enemy.invador_attack_x_direction;
          enemy.y += widthSpritePixel * 10;
        }
      }
    }
    // Движение по x координате до тех пор, пока не коснётся стены
    for (Invador enemy : invadors) {
      enemy.x += invador_attack_x_speed * enemy.invador_attack_x_direction;
    }
    stepTimer = millis();
  }
}



// >>Проверяем достал ли кто то из армии захватичиков пола 
//   или коснулся корабля освободителя
void checkTheLoss() {
  for (Invador enemy : invadors) {
    if (enemy.y > bf.yBottomBorder - bender.spriteHeight) {
      gameOver();
      break;
    }

    if (enemy.x > (bender.x - bender.spriteWidth / 2) && enemy.x < (bender.x + bender.spriteWidth / 2)) {
      if ((enemy.y + enemy.spriteHeight / 2) > (bender.y - bender.spriteHeight / 2)) {
        gameOver();
        break;
      }
    }
  }
}

// Класс для задания размера игрового поля и его границ
// Вывод счёта
// Определение победителя


// >>Класс для задания размера игрового поля и его границ
class BattleField {
  float x, y, w, h;
  float xLeftBorder, xRightBorder, yTopBorder, yBottomBorder;

  BattleField() {
    w = width / 1.1;
    h = height / 1.2;
    x = width / 2;
    y = height / 2;

    xLeftBorder = x - w / 2;
    xRightBorder = x + w / 2;
    yTopBorder = y - h / 2;
    yBottomBorder= y + h / 2;
  }
}

int shotEnemyTimer = millis();
int shotEnemyDelay = 500;

// Увеличение скорости игры в зависимости от количества оставшихся захватичиков
void speedUp() {
  if (invadors.size() < 30) {
    stepTimerDelay = 150;
    shotEnemyDelay = 500;
  }

  if (invadors.size() < 10) {
    stepTimerDelay = 100;
    shotEnemyDelay = 500;
  }

  if (invadors.size() < 3) {
    stepTimerDelay = 50;
    shotEnemyDelay = 500;
  }

  if (invadors.size() == 1) {
    stepTimerDelay = 20;
    shotEnemyDelay = 500;
  }
}

// >>Вывод счёта
void score() {
  textAlign(CENTER);
  fill(#64A074);
  text("score " + counter, bf.xLeftBorder + 30 * widthSpritePixel, bf.yTopBorder - 5 * widthSpritePixel);
}


// >>Определение победителя
void checkWhoWin() {
  // Если истребили всех захватичиков
  if (winCheck()) {
    background(0);
    fill(#9BB8FF);
    textAlign(CENTER);
    text("You win!", width / 2, height / 2);
  }
  checkTheLoss();
}


// >> Отображание количества жизней
void displayNumberOfLives() {
  if (numberOfLives <= 0) gameOver();
  for (Guard shipObj : livesCounter) {
    drawSprite(shipObj.x, shipObj.y, ship);
  }
}


// >> Экран завершения игры
void gameOver() {
  background(0);
  flyingStarts();
  textAlign(CENTER);
  textSize(48);
  text("GAME over", width / 2, height / 2);
  textSize(36);
  text("score " + counter, width / 2, height / 2 + 70);
  //text("press any key for restart", width / 2, height / 3 + 110);
  fill(#9BB8FF);
  noLoop();
}

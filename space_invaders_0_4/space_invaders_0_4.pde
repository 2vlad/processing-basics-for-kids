import processing.sound.*;
SoundFile file;
boolean stopMusic = true;

void setup() {
  background(0);
  PFont font = loadFont("ArcadeClassic-48.vlw");
  textFont(font, 36);
  size(800, 600);
  //fullScreen();
  textAlign(CENTER);
  textSize(36);
  text("loading ..", width / 2, height / 2);

  galaxy = new ArrayList<Star>();
  for (int i = 0; i < 200; i++) {
    galaxy.add(new Star());
  }

  // Создаём игровое поле
  bf = new BattleField();

  // Размер "пикселя" для рисования спрайта
  widthSpritePixel = bf.h / 200;

  // Захватчики и их пули
  invadors = new ArrayList<Invador>();
  invadorBullets = new ArrayList<Bullet>();
  invadorArmyCreate();
  invadorHaveBullets = false;

  // Освободитель и его ракеты
  bender = new Guard(width / 2, bf.yBottomBorder - 5 * widthSpritePixel, ship);
  bullets = new ArrayList<Bullet>();
  bullets_ready = false;


  // Жизни освободителя
  numberOfLives = 3;
  livesCounter = new ArrayList<Guard>();
  float xLivesDisplayStart = bf.xLeftBorder + 100 * widthSpritePixel;
  float yLivesDisplayStart = bf.yTopBorder - 10 * widthSpritePixel;
  for (int i = 0; i < numberOfLives; i++) {
    livesCounter.add(new Guard(xLivesDisplayStart, yLivesDisplayStart, ship));
    xLivesDisplayStart += 30 * 2;
  }

  // Счётчик уничтоженных захватчиков;
  counter = 0;
}

void draw() {
  if (stopMusic) {
    file = new SoundFile(this, "StrangerThingsOST.mp3");
    file.play();
    stopMusic = false;
  }
  
  background(0);
  if (!gameStart) {
    startScreen();
    if (keyPressed && key == ' ') {
      gameStart = true;
    }
  } else game();
}

void game() {
  flyingStarts();

  fill(#A5B7A4);
  invadorArmyDisplay();
  invadorArmyZigzagMove();

  // Отрисовка и движения молний из захватчиков
  if (invadorHaveBullets) {
    for (Bullet invBl : invadorBullets) {
      invBl.display();
      invBl.invaderShoots();
    }
  }

  // Отрисовка и управление кораблём освободителя
  bender.display();
  bender.control();

  // Отрисовка и движение ракет из корабля освободителя
  if (bullets_ready) {
    for (Bullet bl : bullets) {
      bl.display();
      bl.fly();
    }
  }

  hitCheck();     // Проверка на попадание ракет в захватчиков
  invaderBulletsCheck();
  score();        // Вывод счёта
  checkWhoWin();  // Определение кто победил
  speedUp();      // Увеличение скорости игры в зависимости от количества захватчиков

  displayNumberOfLives();
  if (numberOfLives <= 0) gameOver();
}

// Объявляем: наш корабль, врага, звездное поле
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
OurShip edem;
ArrayList <Enemy> enemies = new ArrayList <Enemy>();
Stars[] galaxy;
void setup(){
  size(800, 800);
// Создаем: наш корабль, врага, звезды
  edem = new OurShip();
  galaxy = new Stars[500];
  for(int i = 0; i < 500; i++){
  galaxy[i] = new Stars();
  }
  createArmy();
}

void draw(){
 // Отображаем: корабль, врага, звезды
  background(0);
  edem.display();
  for(int i = 0; i < enemies.size(); i++){
  Enemy e = enemies.get(i);
  e.display();
  }
  for(int i = 0; i < 500; i++){
  galaxy[i].display();
  }
  // отображаем ракеты
  for(int i = 0; i < bullets.size(); i++){
  Bullet b = bullets.get(i);
  b.display();
  }
  println(bullets.size());
}

// Функция для отрисовки спрайтов - принимает спрайт, положение для отрисовки, размер картикни
void drawSprite(int[][] sprite, float x0, float y0, float d){
  noStroke();
// x, y - текущее положение "кисти", со значком 0 - начальное положение ряда/колонки, к которому надо возвращаться
  float x = x0;
  float y = y0;
// высота одного квадратика считается как размер картинки/количество рядов
  float h = d/sprite.length;
  for(int i = 0; i < sprite.length; i++){
//ширина одного квадратика - ширина картинки на количество элементов в ряду
    float w = d/sprite[i].length;
    for(int j = 0; j < sprite[i].length; j++){
// если 0 - то рисуем квадратик белый, 1 - зеленый, 2 - ярко-зеленый
      if(sprite[i][j] == 0){
        fill(0);
      }
      if(sprite[i][j] == 1){
        fill(#0B7E42);
      }
      if(sprite[i][j] == 2){
        fill(#08FA7A);
      }
      rect(x, y, h, w);
      x += w;
    }
    x = x0;
    y += h;
  }
}

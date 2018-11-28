// Объявляем: наш корабль, врага, звездное поле
OurShip edem;
Enemy badBoy;
Stars[] galaxy;
void setup(){
  size(800, 800);
// Создаем: наш корабль, врага, звезды
  edem = new OurShip();
  badBoy = new Enemy();
  galaxy = new Stars[500];
  for(int i = 0; i < 500; i++){
  galaxy[i] = new Stars();
  }
//Увеличивает число пикселей на экране в 2 раза  - по сути, должно смотреться лучше с этим, эффект Ретины
  pixelDensity(2);
}

void draw(){
 // Отображаем: корабль, врага, звезды
  background(0);
  edem.display();
  badBoy.display();
  for(int i = 0; i < 500; i++){
  galaxy[i].display();
  }
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

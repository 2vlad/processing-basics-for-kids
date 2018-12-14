Ball pong = new Ball();
Platform1 player1 = new Platform1();
Platform2 player2 = new Platform2();
float multiply = 1.1;
void setup(){
  size(1200, 800);
}

void draw(){
  background(#1BF2ED);
  pong.display();
  player1.display();
  player2.display();
}

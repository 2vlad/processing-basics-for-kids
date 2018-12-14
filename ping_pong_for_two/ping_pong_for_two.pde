Ball pong = new Ball();
Platform player1 = new Platform();
Platform player2 = new Platform();
void setup(){
  size(1200, 800);
}

void draw(){
  background(#1BF2ED);
  pong.display();
  player1.display();
}

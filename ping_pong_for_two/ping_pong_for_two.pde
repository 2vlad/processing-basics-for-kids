Ball pong = new Ball();
Platform1 player1 = new Platform1();
Platform2 player2 = new Platform2();
float multiply = 1.05;
float score1 = 0;
float score2 = 0;
PFont font;
void setup() {
  size(1200, 800);
  font = loadFont("ImprintMT-Shadow-48.vlw");
}

void draw() {
  background(#1BF2ED);
  pong.display();
  player1.display();
  player2.display();
  end();
}

void end() {
  textFont(font, 32);
  //textSize(30);
  fill(0);
  String s1 = nf(score1, 1, 0);
  String s2 = nf(score2, 1, 0);
  text(" - ", width/2 - 10, 50);
  text(s1, width/2 - 30, 50);
  text(s2, width/2 + 30, 50);
  if (pong.x + pong.d/2 < 0) {
    textFont(font, 50);
    //textSize(50);
    text("Player 2 wins this round", width/2 - 250, height/2);
    textSize(30);
    text("Press space to restart", width/2 - 130, height/2 + 50);
    score2 ++;
    noLoop();
  }
  if (pong.x + pong.d/2 > width) {
    textFont(font, 50);
    //textSize(50);
    text("Player 1 wins this round", width/2 - 250, height/2);
    textSize(30);
    text("Press space to restart", width/2 - 130, height/2 + 50);
    score1 ++;
    noLoop();
  }
}

PImage []tennis = new PImage[22];

Ball pong = new Ball();
Platform1 player1 = new Platform1();
Platform2 player2 = new Platform2();
float multiply = 1.05;
float score1 = 0;
float score2 = 0;
PFont font;
int c = 0;
void setup() {
  size(1200, 800);
  font = loadFont("ImprintMT-Shadow-48.vlw");
  //frameRate(10);
  createGif();
  showGif();
}

void draw() {
  if ( c == 0) {
    background(#1BF2ED);
    showGif();
    //pong.display();
    player1.display();
    player2.display();
    end();
  } else {
    //println(c);
    background(#1BF2ED);
    pong.display();
    player1.display();
    player2.display();
    end();
  }
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
    //image(tennis[frameCount%22], 400, 200, 150, 150);
    //showGif();
    noLoop();
  }
  if (pong.x + pong.d/2 > width) {
    textFont(font, 50);
    //textSize(50);
    text("Player 1 wins this round", width/2 - 250, height/2);
    textSize(30);
    text("Press space to restart", width/2 - 130, height/2 + 50);
    score1 ++;
    //image(tennis[frameCount%22], 400, 200, 150, 150);
    //showGif();
    noLoop();
  }
}

void createGif() {
  tennis[0] = loadImage("gif/frame_00_delay-0.05s.gif");
  tennis[1] = loadImage("gif/frame_01_delay-0.05s.gif");
  tennis[2] = loadImage("gif/frame_02_delay-0.05s.gif");
  tennis[3] = loadImage("gif/frame_03_delay-0.05s.gif");
  tennis[4] = loadImage("gif/frame_04_delay-0.05s.gif");
  tennis[5] = loadImage("gif/frame_05_delay-0.05s.gif");
  tennis[6] = loadImage("gif/frame_06_delay-0.05s.gif");
  tennis[7] = loadImage("gif/frame_07_delay-0.05s.gif");
  tennis[8] = loadImage("gif/frame_08_delay-0.05s.gif");
  tennis[9] = loadImage("gif/frame_09_delay-0.05s.gif");
  tennis[10] = loadImage("gif/frame_10_delay-0.05s.gif");
  tennis[11] = loadImage("gif/frame_11_delay-0.05s.gif");
  tennis[12] = loadImage("gif/frame_12_delay-0.05s.gif");
  tennis[13] = loadImage("gif/frame_13_delay-0.05s.gif");
  tennis[14] = loadImage("gif/frame_14_delay-0.05s.gif");
  tennis[15] = loadImage("gif/frame_15_delay-0.05s.gif");
  tennis[16] = loadImage("gif/frame_16_delay-0.05s.gif");
  tennis[17] = loadImage("gif/frame_17_delay-0.05s.gif");
  tennis[18] = loadImage("gif/frame_18_delay-0.05s.gif");
  tennis[19] = loadImage("gif/frame_19_delay-0.05s.gif");
  tennis[20] = loadImage("gif/frame_20_delay-0.05s.gif");
  tennis[21] = loadImage("gif/frame_21_delay-0.05s.gif");
}

void showGif() {
  for (int i = 0; i < 22; i++) {
    image(tennis[frameCount%22], 500, 100, 200, 200);
  }
}

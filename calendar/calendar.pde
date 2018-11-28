int x = 40;
int y = 40;
int d = 100;
int day = 1;
int clickX, clickY;
int cX, cY;
void setup(){
  size(800,800);
}

void draw(){
  background(255);
  for(int i = 0; i < january.length; i++){
    for(int j = 0; j < january[i].length; j++){
      if(january[i][j] == 0){
      fill(255, 255, 0);
      }
      if(january[i][j] == 1){
      fill(255, 0, 0);
      }
      if(january[i][j] == 2){
      fill(0, 255, 255);
      }
       rect(x, y, d, d);
       fill(0);
       textSize(50);
       text(day, x + d/4, y + 5*d/7);
       day++;
       x += d;
    }
    x = 40;
    y += d;
  }
  y = 40;
  day = 1;
  click();
}
void click(){
  if(mousePressed == true){
  clickX = mouseX;
  clickY = mouseY;
  cX = (clickX - 40)/d;
  cY = (clickY - 40)/d;
  println(clickX, clickY, cX, cY);
  if(cY < 5 && cX < 7){
    january[cY][cX] = 2;
  }
  }
  if(keyPressed == true){
  for(int i = 0; i < january.length; i++){
    for(int j = 0; j < january[i].length; j++){
       if(j != 5 && j !=6){
           january[i][j] = 0;
       }
       else{
           january[i][j] = 1;
       }
  }
  }
}
}

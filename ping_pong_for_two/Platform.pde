class Platform{
  float x, y, d, h, speed;
  Platform(){
    x = 20;
    y = height/2;
    d = 20;
    h = 100;
    speed = 10;
  }
  void display(){
    fill(#E896CD);
    rect(x, y, d, h);
    move();
    check();
  }
  void move(){
    if(keyPressed == true && key == 'w'){
      y -= speed;
    }
    if(keyPressed == true && key == 's'){
      y += speed;
    }
  }
  void check(){
    
  }
}

class Hero{
  float x, y, d;
  Hero(){
    x = width/2;
    y = height - 150;
    d = 150;
  }
  void display(){
    image(gun, x, y, d, d);
    x = mouseX;
    y = mouseY;
  }
}

class Bullet {
  float x, y, speed;
  float d;
  // пули создаются с учетом Х и У, которые мы им передаем (наши текущие)
  Bullet(float xc, float yc) {
    x = xc;
    y = yc;
    speed = 10;
    d = 20;
  }
  void display() {
    drawSprite(bullet, x, y, d);
    y -= speed;
    delete();
  }
  void delete(){
  for(int i = 0; i < bullets.size(); i++){
  Bullet b = bullets.get(i);
  if(b.y < 0){
  bullets.remove(i);
  }
  }
}
}

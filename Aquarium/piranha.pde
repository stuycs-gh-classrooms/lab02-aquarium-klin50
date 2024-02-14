class piranha extends animal {
  float cooldown;
  piranha(int px, int py) {
    super(px, py);
    cooldown = frameRate * 3;
  }
  void chase() {
    moveX;
    moveY;
    if (food < 10) {
      xSpeed *= 2;
      ySpeed *= 2;
      for (animal animalDummy : t.animals) {
        if (!(animalDummy instanceof piranha) && dist(animalDummy.x, animalDummy.y, x, y) < size*3) {
          moveX = player1.x-x;
          moveY = player1.y-y;
          if (moveX > 0 && x + size/2 < width) {
            x +=speed;
          }
          if (moveY > 0 && y + size/2 < height) {
            y +=speed;
          }
          if (moveX < 0 && x-size/2 > 0) {
            x -=speed;
          }
          if (moveY < 0 && y-size/2 > 0) {
            y -=speed;
          }
        }
      }
    }
  }
}

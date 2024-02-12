class animal {
  float x;
  float y;
  float size;
  boolean isAlive;
  int hp;
  float xSpeed;
  float ySpeed;
  animal(int ax, int ay) {
    x = ax;
    y = ay;
    size = 20;
    xSpeed = random(-0.5,0.5);
    ySpeed = random(-0.5,0.5);
    hp = 10;
    isAlive = true;
  }
    animal() {
    x = int(random(size,width-size));
    y = int(random(tankY+size,tankY+tankH-floorH));
    size = 20;
    xSpeed = random(1, 5);
    ySpeed = random(1, 5);
    hp = 10;
    isAlive = true;
  }
  void display() {
    fill(#9220F7);
    square(x, y, size);
  }
  void move() {
    if (x+size+xSpeed >= width || x+xSpeed <= 0) {
      xSpeed *= -1;
    }
    if (y+size+ySpeed >= height || y+ySpeed <= tankY) {
      ySpeed *= -1;
    }
    x += xSpeed;
    y += ySpeed;
  }
}

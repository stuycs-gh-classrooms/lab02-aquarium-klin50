class animal {
  float x;
  float y;
  float size;
  boolean isAlive;
  float food;
  int hp;
  float xSpeed;
  float ySpeed;
  float decayA;
  animal(float ax, float ay) {
    x = ax;
    y = ay;
    size = 20;
    xSpeed = random(-0.5, 0.5);
    ySpeed = random(-0.5, 0.5);
    hp = 5;
    isAlive = true;
    food = 100;
    decayA = 100;
  }
  animal() {
    x = int(random(size, width-size));
    y = int(random(tankY+size, tankY+tankH-floorH));
    size = 20;
    xSpeed = random(-0.5, 0.5);
    ySpeed = random(-0.5, 0.5);
    hp = 10;
    isAlive = true;
    food = 100;
    decayA = 100;
  }
  void display() {
      fill(#9220F7);
      square(x, y, size);
  }
  void move() {
    if (isAlive == true) {
      if (food <= 0) {
        hp -= 1;
      }
      if (hp <= 0) {
        this.die();
      }
      if (x+size+xSpeed >= width || x+xSpeed <= 0) {
        xSpeed *= -1;
      }
      if (y+size+ySpeed >= height-floorH || y+ySpeed <= tankY) {
        ySpeed *= -1;
      }
      x += xSpeed;
      y += ySpeed;
      food -= 0.02;
    }
  }
  void die() {
    this.isAlive = false;
  }
  void dieMove() {
    if (isAlive == false && y > tankY) {
      this.y -= 1;
    }
  }
  void decay() {
    if (isAlive != true) {
      decayA -= 0.2;
    }
  }
  void eat() {
    for (food Food : t.foods) {
      if (dist(Food.x, Food.y, this.x, this.y) < this.size/2) {
        if (!Food.isEaten) {
          this.food += 10;
          Food.isEaten = true;
        }
      }
    }
  }
}

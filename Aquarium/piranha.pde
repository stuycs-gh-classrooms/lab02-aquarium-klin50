class piranha extends animal {
  float cooldown;
  int target;
  boolean hunting;
  piranha(int px, int py) {
    super(px, py);
    cooldown = frameRate * 3;
    hunting = false;
    target = 0;
  }
  void display() {
    fill(0, 255, 0);
    rect(x, y, size, size/2);
  }
  void chase() {
    float moveX;
    float moveY;
    if (hunting == true) {
      animal animalDummy = t.animals.get(target);
      moveX = animalDummy.x-x;
      moveY = animalDummy.y-y;
      this.randomTarget();

      if (moveX > 0 && x + size/2 < width) {
        x +=xSpeed;
      }
      if (moveY > 0 && y + size/2 < height) {
        y +=ySpeed;
      }
      if (moveX < 0 && x-size/2 > 0) {
        x -=xSpeed;
      }
      if (moveY < 0 && y-size/2 > 0) {
        y -=ySpeed;
      }
    }
  }
  void move() {
    if (food < 10 && hunting == false) {
      xSpeed *= 2;
      ySpeed *= 2;
      hunting = true;
    }
    this.chase();
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
    if (hunting == true) {
      this.attack();
    }
  }
  void attack() {
    animal animalDummy = t.animals.get(target);
    if (dist(animalDummy.x, animalDummy.y, x, y) < size) {
      animalDummy.hp -= 1;
    }
  }
  void randomTarget() {
    target = int(random(t.animals.size()-1));
    while (t.animals.get(target) instanceof piranha) {
      target = int(random(t.animals.size() -1));
    }
  }
}

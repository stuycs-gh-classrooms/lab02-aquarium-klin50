class piranha extends animal {
  float cooldown;
  int target;
  boolean hunting;
  int frameNumber;
  piranha(int px, int py) {
    super(px, py);
    cooldown = frameRate * 3;
    hunting = false;
    target = 0;
    this.food = 15;
    frameNumber = 0;
  }
  void display() {
    fill(0, 255, 0);
    rect(x, y, size, size/2);
  }
  void chase() {
    float moveX;
    float moveY;
    if (hunting == true && t.animals.size() > 0) {
      if (target >= t.animals.size()) {
        randomTarget();
      }
      animal animalDummy = t.animals.get(target);
      moveX = animalDummy.x-x;
      moveY = animalDummy.y-y;

      if (moveX > 0 && x + size/2 < width) {
        x +=abs(xSpeed);
      }
      if (moveY > 0 && y + size/2< height) {
        y +=abs(ySpeed);
      }
      if (moveX <= 0 && x > 0) {
        x -=abs(xSpeed);
      }
      if (moveY <= 0 && y > tankY) {
        y -=abs(ySpeed);
      }
    } else {
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
    }
    food -=0.02;
  }
  void move() {
    if (food < 10 && hunting == false) {
      xSpeed = 1;
      ySpeed = 1;
      hunting = true;
      this.randomTarget();
    }
    if (food > 10 && hunting == true) {
      hunting = false;
      xSpeed = random(-0.5, 0.5);
      ySpeed = random(-0.5, 0.5);
    }
    if (isAlive) {
      this.chase();
    }
    if (hunting == true && t.animals.size() > 0 && isAlive) {
      this.attack();
    }
  }
  void attack() {
    if (isAlive && (frameCount - frameNumber > cooldown)) {
      frameNumber = frameCount;
      animal animalDummy = t.animals.get(target);
      if (dist(animalDummy.x, animalDummy.y, x, y) < size) {
        animalDummy.hp -= 1;
        this.food += 10;
      }
    }
  }
  void randomTarget() {
    target = int(random(t.animals.size()-1));
  }
}

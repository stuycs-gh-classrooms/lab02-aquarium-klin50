class crab extends animal {
  PImage crabPic;
  PImage crabPicDie;
  crab() {
    super();
    crabPic = loadImage("crabPic.png");
    crabPicDie = loadImage("crabPicDie.png");
    size*=4;
    xSpeed = random(-0.3, 0.3);
    ySpeed = random(-0.3, 0.3);
    x = int(random(size, width-size));
    y = int(random(tankY+tankH-floorH, height-size));
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
      if (y+size+ySpeed >= height || y+ySpeed <= height-floorH) {
        ySpeed *= -1;
      }
      x += xSpeed;
      y += ySpeed;
    }
  }
  void display() {
    if (isAlive == true) {
      image(crabPic, x, y, size, size/2);
    } else {
      image(crabPicDie, x, y, size, size/2);
    }
  }
  void dieMove(){
  }
}

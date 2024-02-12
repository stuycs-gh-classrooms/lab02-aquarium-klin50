class crab extends animal {
  PImage crabPic;
  crab() {
    super();
    crabPic = loadImage("crabPic.png");
    size*=4;
    xSpeed = random(-0.3,0.3);
    ySpeed = random(-0.3,0.3);
    x = int(random(size, width-size));
    y = int(random(tankY+tankH-floorH, height-size));
  }
  void move() {
    if (x+size+xSpeed >= width || x+xSpeed <= 0) {
      xSpeed *= -1;
    }
    if (y+size+ySpeed >= height || y+ySpeed <= height-floorH) {
      ySpeed *= -1;
    }
    x += xSpeed;
    y += ySpeed;
  }
  void display() {
    image(crabPic,x, y,size,size/2);
  }
}

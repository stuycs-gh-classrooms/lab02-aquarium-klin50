class bettaFish extends animal {
  float angle = 0; // angular direction
  float turnSpeed = 0.05;
  float dartSpeed = 4;
  boolean isDarting = false;
  int dartCount = 120; // frames between darts
  int coolDown = 120;
  float dx;
  float dy;
  float speed;

  bettaFish(float x, float y) {
    super(x, y);
    size*=2;
    if (xSpeed < 0) {
      dx = -1;
    } else {
      dx = 1;
    }
    if (ySpeed < 0) {
      dy = -1;
    } else {
      dy = 1;
    }
    speed = xSpeed/2+ySpeed/2;
  }

  void display() {
    if (isDarting) {
      fill(255, 0, 0);
    } else {
      fill(25, 150, 255);
    }
    square(x, y, size);
  }

  void startDart() {
    if (!isDarting && random(25) < 0.25) {
      isDarting = true;
      dartCount = (int)random(25, 50);
      angle += PI;
    }

    if (isDarting) {
      if (dartCount > 0) {
        dx = cos(angle) * dartSpeed;
        dy = sin(angle) * dartSpeed;
        dartCount--;
      } else
      {
        isDarting = false;
        coolDown = (int)random(50, 200);
      }
    } else
    {
      if (random(1) > 0.5) {
        angle += turnSpeed;
      } else {
        angle -= turnSpeed;
      }

      dx = cos(angle) * speed;
      dy = sin(angle) * speed;

      if (--coolDown <= 0)
      {
        angle += PI;
      }
    }
  }

  void move() {
    startDart();
    x += dx;
    y += dy;

    if (x < tankX + size/2 || x > tankX + tankW - size/2) {
      angle += PI;
    }
    if (y < tankY + size/2 || y > tankY + tankH - floorH - size/2) {
      angle += PI;
    }

    if (x <= tankX || x >= tankX + tankW - size) {
      dx = -dx;
      x += dx * speed;
    }

    if (y <= tankY || y >= height-floorH) {
      dy = -dy;
      y += dy * speed;
    }
  }
}

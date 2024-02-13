class shrimp extends animal { // will probably change to snail later

  shrimp(float x, float y) {
    super(x, y);
    this.y = tankY + tankH - floorH - size * 2;
  }

    void display() {
    fill(255, 185, 195); 
    circle(x,y,size);
  }
  
  void move() {

    x += xSpeed;

    if (x < tankX + size/2) {
      x = tankX + size/2;
    }
    if (x > tankX + tankW - size/2) {
      x = tankX + tankW - size/2; 
    }
  }
}

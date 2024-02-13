class food {
  float x;
  float y;
  int size;
  boolean isEaten;
  food(int cx, int cy) {
    x = cx;
    y = cy;
    size = 5;
    isEaten = false;
  }
  void display() {
    if (!isEaten) {
      fill(#524425);
      circle(x, y, size);
    }
  }
  void move() {
    if (y < height-size) {
      y += 0.2;
    }
  }
  void eaten() {
    if (isEaten) {
      t.foods.remove(this);
    }
  }
}

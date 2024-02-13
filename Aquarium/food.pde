class food {
  int x;
  int y;
  int size;
  food(int cx, int cy) {
    x = cx;
    y = cy;
    size = 5;
  }
  void display() {
    fill(#524425);
    circle(x, y, size);
  }
  void move() {
    y -= 1;
  }
}

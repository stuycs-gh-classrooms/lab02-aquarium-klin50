class tank {
  ArrayList<animal> animals;
  int x;
  int y;
  int floorHeight;
  int tankWidth;
  int tankHeight;
  tank(int tx, int ty, int twidth, int theight, int fheight) {
    animals = new ArrayList<animal>();
    x = tx;
    y = ty;
    floorHeight = fheight;
    tankWidth = twidth;
    tankHeight = theight;
  }
  void display() {
    fill(#20F7E4);
    rect(x, y, tankWidth, tankHeight-floorHeight);
    fill(#f6d7b0);
    rect(x, y+tankHeight-floorHeight, tankWidth, floorHeight);
    for (animal animalDummy : animals) {
      animalDummy.display();
    }
  }
  void moveAnimals() {
    for (animal animalDummy : animals) {
      animalDummy.move();
    }
  }
  void addAnimal() {
    int a = int(random(0, 3));
    if (a >1) {
      animals.add(new crab());
    } else {
      animals.add(new fish(mouseX,mouseY));
    }
  }
}

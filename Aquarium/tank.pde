class tank {
  ArrayList<animal> animals;
  ArrayList<food> foods;
  int x;
  int y;
  int floorHeight;
  int tankWidth;
  int tankHeight;
  tank(int tx, int ty, int twidth, int theight, int fheight) {
    animals = new ArrayList<animal>();
    foods = new ArrayList<food>();
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
      animalDummy.eat();
      animalDummy.move();
      animalDummy.dieMove();
      animalDummy.decay();
      animalDummy.despawn();
    }
  }
  void addAnimal(int a) {
    if (mouseY > tankY) {
      if (a == 1) {
        animals.add(new fish(mouseX, mouseY));
      }
      if (a == 2) {
        animals.add(new crab());
      }
      if (a == 3) {
        animals.add(new bettaFish(mouseX, mouseY));
      }
      if (a == 4) {
        animals.add(new shrimp(mouseX, mouseY));
      }
    }
  }
  void addFood() {
    foods.add(new food(mouseX, mouseY));
  }
}

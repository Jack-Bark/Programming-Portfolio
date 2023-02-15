// Jack Barklow | 24 Oct 2022 | Car App
Car c1, c2;
Car[] cars = new Car[100];

void setup () {
  size(displayWidth, displayHeight);
  c1 = new Car();
  c2 = new Car();
  for (int i=0; i<cars.length; i++) {
    cars[i] = new Car();
  }
}

void draw () {
  background(127);
   for (int i=0; i< width; i+=20) {
    line(0, i, width, i);
  }
  c1.display();
  c1.drive();
  c2.display();
  c2.drive();
  for (int i=0; i<cars.length; i++) {
    cars[i].display();
    cars[i].drive();
  }
}

// Jack Barklow | October 3rd 2022 | Etchasketch
int x, y;

void setup() {
  size(500, 500);
  x = width/2;
  y = height/2;
  background(255);
}

void draw() {
  stroke(0);
  strokeWeight(3);
  if (keyPressed) {
    if(key == 'w') {
      moveUp(10);
    } else if(key == 'a') {
      moveLeft(10);
    } else if(key == 's') {
      moveDown(10);
    } else if(key == 'd') {
      moveRight(10);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      moveUp(5);
    } else if (keyCode == RIGHT) {
      moveRight(5);
    } else if (keyCode == DOWN) {
      moveDown(5);
    } else if (keyCode == LEFT) {
      moveLeft(5);
    }
  }
}

void mousePressed() {
  saveFrame("image-#####.png");
}

void moveDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y+i);
  }
  y=y+rep;
}

void moveUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y-i);
  }
  y=y-rep;
}

void moveLeft(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y);
  }
  x=x-rep;
}

void moveRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y);
  }
  x=x+rep;
}

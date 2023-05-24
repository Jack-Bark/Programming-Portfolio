class Star {
  int x, y, diam, speed;

  // Constructor
  Star() {
    x = int(random(width));
    y = int(random(height));
    diam = int(random(1, 4));
    speed = int(random(1, 4));
  }

  void display() {
    fill(255);
    ellipse(x, y, diam, diam);
  }

  void move() {
    if (y>height+5) {
      y = -5;
    } else {
      y += speed;
    }
  }

  boolean reachedBottom() {
    return true;
  }
}

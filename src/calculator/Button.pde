class Button {
  // Member Variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on;

  // Constructor
  Button(int x, int y, int w, int h, char val, color c1, color c2) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    this.c1 = c1;
    this.c2 = c2;
    c1 = color(#D6994C);
    c2 = color(#A6763C);
    on = false;
  }

  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER);
    if (val == 'c') {
      text("Clear", x+40, y+40);
    } else if (val =='s') {
      text("X²", x+45, y+40);
    } else {
      text(val, x+40, y+40);
    }
  }
  void hover(int mx, int my) {
    on = (mx > x && mx < x+w && my > y && my < y+h);
  }
}

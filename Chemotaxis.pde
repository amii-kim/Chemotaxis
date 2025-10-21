 Bacteria[] colony;
int targetX = 500;
int targetY = 250;

void setup() {  
  size(1000, 500);
  colony = new Bacteria[100];
  resetColony();  
}

void draw() {    
  background(0);

  // flashing target with random color
  fill((int)(Math.random()*200), (int)(Math.random()*200), (int)(Math.random()*200));
  ellipse(targetX, targetY, 20, 20);

  // move and show all bacteria
  for (int i = 0; i < colony.length; i++) {
    colony[i].move(targetX, targetY);
    colony[i].show();
  }
}

void mousePressed() {
  targetX = mouseX;
  targetY = mouseY;
  resetColony();
}

class Bacteria {     
  int myX, myY, myColor;

  Bacteria(int x, int y, int c) {
    myX = x;
    myY = y;
    myColor = c;
  }

  void move(int z, int q) {
    myX += (int)(Math.random() * 7) - 3;
    myY += (int)(Math.random() * 7) - 3;

    if (Math.random() < 0.2) {
      if (z > myX) 
      myX++;
      if (z < myX)
      myX--;
      if (q > myY) 
      myY++;
      if (q < myY)
      myY--;
    }

    if (myX < 0) 
    myX = 0;
    if (myX > 1000) 
    myX = 1000;
    if (myY < 0)
    myY = 0;
    if (myY > 500) 
    myY = 500;
  }

  void show() {
    fill(myColor);
    noStroke();
    ellipse(myX, myY, 10, 10);
  } 
}


void resetColony() {
  for (int i = 0; i < colony.length; i++) {
    colony[i] = new Bacteria(
      (int)(Math.random() * 1000),
      (int)(Math.random() * 500),
      color((int)(Math.random() * 240), (int)(Math.random() * 256), (int)(Math.random() * 256)));
  }
}

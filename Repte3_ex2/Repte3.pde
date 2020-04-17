Mover mover;

  void setup() {
    mover = new Mover();
  }
  
  void draw() {
    background(175);
    mover.update();
    mover.checkEdges();
    mover.display();
  }

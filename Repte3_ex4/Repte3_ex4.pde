class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed = 10;
  
  Mover() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(-0.001,0.01);
  }
  
  void update() {
   
    PVector mouse = new PVector(mouseX,mouseY); // li diem la direcció del punter del mouse
    PVector dir = PVector.sub(mouse,location); // caluclem la direcció
 
    dir.normalize(); // normalitzem aquesta direcció obtinguda
 
    dir.mult(0.5); // la escalem
 
    acceleration = dir; // li apliquem acceleració
 
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16,16);
  }
   
  }

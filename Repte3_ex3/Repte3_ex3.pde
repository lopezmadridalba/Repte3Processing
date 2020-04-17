class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed; // fiquem la velocitat superior que limitará la magnitud de la velocitat
  
  Mover() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(-0.001,0.01);
    topspeed = 10;
  }
  
  void update() {
    
    acceleration = PVector.random2D(); // La funcio random2D ens donarà un PVector de longuitud 1 apuntant a una direcció aleatoria
    
    velocity.add(acceleration); // la velocitat canvia per l'acceleració i està a més, limitada per la velocitat màxima, que en aquest cas l'he ficat a 10
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16,16);
  }
  
  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
      
    }   
  }

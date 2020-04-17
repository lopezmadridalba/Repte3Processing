class Mover {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Mover() {
    //aqui es pot comprovar com les velocitats afecten a les forzes que fa que vagi cap abaix  
    location = new PVector(width/2,height/2); la localització que tindrá
    velocity = new PVector(0,0);
    acceleration = new PVector(-0.001,0.01); // la velocitat de acceleració que anira aumentant
    topspeed = 10; // li apliquem la velocitat maxima
  }
  
  void update() {

    // anira executant la acceleració constant fins arribar a la velocitat limit
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  // metode per poder dir els colors i mides de l'ellipse
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16,16);
  }
  // metode vist anteriorment que detectava les colisions amb les voreres de les parets de la finestra
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

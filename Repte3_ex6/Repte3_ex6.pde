Mover[] movers = new Mover[60]; // faig una array 60 elipses per fer que siguin gotes de la pluja
Mover mover;
 
void setup() {
  size(640,360);
  background(255);
  
  for (int i = 0; i < movers.length; i++) { //Genero un bucle per anar generant cada elipse
    movers[i] = new Mover();
  }
  
  mover = new Mover();
}
 
void draw() {
  background(255);
  
  mover.updateM(); // crido els metodes per generar la visualització i el moviment de la mosca
  mover.displayM();
  
  mover.updateA(); // crido els metodes per generar la visualitzacio i moviment del ocell
  mover.displayA();
  mover.checkEdgesA();
 
  for (int i = 0; i < movers.length; i++) { // faig un bucle per generar el moviement i visualitzacio per les 60 gotes de pluja

    movers[i].updateP();
    movers[i].checkEdgesP();
    movers[i].displayP();
  }
}
 
class Mover {
 
  PVector locationP;
  PVector velocityP;
  float topspeedP;
  
  PVector locationMosca;
  PVector velocityMosca;
  PVector accelerationM;
  float topspeedM = 10;
  
  PVector locationA;
  PVector velocityA;
  PVector accelerationA;
  float topspeedA = 10;
 
  Mover() {
    
    locationMosca = new PVector(width/2, height/2); // li dic que la seva localitzacio sigui al mig de la pantalla
    velocityMosca = new PVector(0, 0);
    accelerationM = new PVector(-0.001, 0.01); // li indico la acceleració que ha de tenir
    
    locationP = new PVector(random(width),random(height)); // li dic que la seva localitzacio sigui random
    velocityP = new PVector(0,3); // li dic quina sera la velocitat que tindrà en direcció de les Y
    topspeedP = 4; // la velocitat maxima que pot obtenir
    
    locationA = new PVector(width/2,height/2);
    velocityA = new PVector(0,0);
    accelerationA = new PVector(-0.001,0.01);
    topspeedA = 10;
  }
 
  void updateP() {
    // li fico a la velocitat i el seu limit que han d'anar caient
    velocityP.limit(topspeedP);
    locationP.add(velocityP);
  }
  
    void updateA() {
    accelerationA = PVector.random2D(); // li dic que ha de tenir una acceleració respecta la establerta random
    velocityA.add(accelerationA);
    velocityA.limit(topspeedA);
    locationA.add(velocityA);
  }
  
    void updateM() {

    PVector mouse = new PVector(mouseX, mouseY); // d'aquesta manera em detecta quina es la posicio del punter del mouse
    PVector dir = PVector.sub(mouse, locationMosca); // aixi sabra en quina direcció ha d'anar respecte la seva posicio i la del punter

    dir.normalize(); // es normalitza la direcció amb la funcio de normalize del PVector
    dir.mult(0.5); 

    accelerationM = dir; 
    // li afegim la acceleracio, limitem la velocitat i se l'ha afegim
    velocityMosca.add(accelerationM);
    velocityMosca.limit(topspeedM);
    locationMosca.add(velocityMosca);
  }
 
// fem els display amb les caracterisitiques de la pluja i la mosca, segons les seves mides i colors
  void displayP() {
    stroke(103, 187, 252);
    fill(103, 187, 252);
    ellipse(locationP.x,locationP.y,4,4);
  }
  
    void displayM() {
    stroke(10,10,10);
    fill(10,10,10);
    ellipse(locationMosca.x, locationMosca.y, 7, 7);
  }
  
    void displayA() {
    stroke(128, 64, 0);
    fill(128, 64, 0);
    ellipse(locationA.x, locationA.y, 16, 16);
  } 

  void checkEdgesP() {
 
    if (locationP.x > width) {
      locationP.x = 0;
    } else if (locationP.x < 0) {
      locationP.x = width;
    }
    if (locationP.y > height) {
      locationP.y = 0;
    }  else if (locationP.y < 0) {
      locationP.y = height;
    }
  }
  
    void checkEdgesA() {
 
    if (locationA.x > width) {
      locationA.x = 0;
    } else if (locationA.x < 0) {
      locationA.x = width;
    }
    if (locationA.y > height) {
      locationA.y = 0;
    }  else if (locationA.y < 0) {
      locationA.y = height;
    }
  }
}

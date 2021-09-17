
class AstroidManager {
  ArrayList<Astroid> astroids = new ArrayList<Astroid>();
  int astroidCount = 1;
  int counter = 1;
  boolean hasAdded = false;
  
  void spawnAsteroids() {
    for (int i = 0; i < astroidCount && astroids.size() < astroidCount+1; i++) {
      astroids.add(new Astroid());
    }
    if (astroids.size() == astroidCount + 1){
      hasAdded = false;
    }
  }

  void displayAsteroids() {
    if (astroids.size() != 0) {
      for (Astroid a : astroids) {
        a.display();
        a.update();
      }
    }
  }

  void removeAsteroids() {
    if (astroids.size() != 0) {
      for (int i = astroids.size()-1; i >= 0; i--) {
        Astroid b = astroids.get(i);
        if (b.offScreen == true) {
          astroids.remove(b);
          counter++;
          
        }
      }
    }
  }



  void run() {
    spawnAsteroids();
    removeAsteroids();
    displayAsteroids();
    if (counter % 7 == 0 && hasAdded == false){
      astroidCount++;
      hasAdded = true;
    }
    println(astroidCount);
    println(counter);
    println("-");
    
  }
}

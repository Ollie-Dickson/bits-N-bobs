ArrayList<Prey> prey;
ArrayList<Predator> predators;

class Population {

 
  
  Population () {
    prey = new ArrayList<Prey>();
    predators = new ArrayList<Predator>();
    init();
  }
  
  
  void init() {
    prey_ = 0;
    for (int i = edgeSpace; i < width-edgeSpace; i++) {
      for (int j = edgeSpace; j < height-edgeSpace; j ++) {
        float r = random(1);
        if (r < preyChance) {
          addPrey(new Prey(i, j));
        } else if (r < predChance + preyChance) {
          addPredator(new Predator(i, j));
        }
      }
    }
  }
  
  
  void run() {
   for (Prey p : prey) {
     p.run();
   }
   for (Predator p : predators) {
     p.run();
   }
   newborns();
   slain();
  }
  
  void newborns() {
     for ( int i = prey.size() -1; i>=0; i--) {
      prey.get(i).newborns();
    }
    for ( int i = predators.size() -1; i>=0; i--) {
      predators.get(i).newborns();
    }
  }
  
  void slain() {
    for ( int i = prey.size() -1; i>=0; i--) {
      if (prey.get(i).isDead) {
      prey.remove(i);
      prey_--;
      }
    }
    for ( int i = predators.size() -1; i>=0; i--) {
      if (predators.get(i).isDead) {
      predators.remove(i);
      predators_--;
      }
    }
  }
  
  
  void addPrey(Prey p) {
     prey.add(p);
     prey_++;
   }
   
   void addPredator(Predator p) {
     predators.add(p);
     predators_++;
   }
  
  
  
  void saveData() {
   TableRow row = table.addRow();
   row.setInt("prey", prey_);
   row.setInt("predators", predators_);
   row.setInt("timeStep", timeSteps);
   
   saveTable(table, "data/" + fileName + ".csv");
  }
  
  
  
}

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
  
  
  
  
  
  
  
  
  
  
  //void generate() {
    
  //  int hostsCount = 0;
  //  int consumersCount = 0;
  // for (int i = 0; i < columns; i++) {
  //  for (int j = 0; j < rows; j++) {
     
  //   if (board[i][j].state == 1){
  //     hostsCount ++;
  //   } else if (board[i][j].state == 2){
  //     consumersCount ++;
  //   }
  //  }
  // }
  // hosts = hostsCount;
  // consumers = consumersCount;
   
  // for (int x = 0; x < columns; x++) {
  //  for (int y = 0; y < rows; y++) {
     
      
  //   // hosts reproduce
  //   if (board[x][y].state == 1) {
       
  //    for (int i = -1; i <=1; i++) {
  //     for (int j = -1; j <= 1; j++) {
  //       if((i == 0)&&(j == 0)) {
  //       } else {
  //         if (board[(x+i+columns)%columns][(y+j+rows)%rows].state == 0) {
  //          float r = random(1);
  //          if (r <= g) {
  //            board[(x+i+columns)%columns][(y+j+rows)%rows].state = 1;
  //          }
  //         }
  //       }
  //     }
  //    }
      
  //   }
     
  //   // consumers spread and die
  //   if (board[x][y].state == 2) {
       
  //     for (int i = -1; i <=1; i++) {
  //     for (int j = -1; j <= 1; j++) {
  //       if((i == 0)&&(j == 0)) {
  //       } else {
  //         if (board[(x+i+columns)%columns][(y+j+rows)%rows].state == 1) {
  //          float r = random(1);
  //          if (r <= T) {
  //            board[(x+i+columns)%columns][(y+j+rows)%rows].state = 2;
  //          }
  //         }
  //       }
  //     }
  //    }
  //    float r = random(1);
  //     if (r <= v) {
  //       board[x][y].state = 0;
  //     }
  //   }
      
      
  //  }
  // }
  
  
  //}
  
  
  
  
  void saveData() {
   TableRow row = table.addRow();
   row.setInt("prey", prey_);
   row.setInt("predators", predators_);
   row.setInt("timeStep", timeSteps);
   
   saveTable(table, "data/" + fileName + ".csv");
  }
  
  
  
}

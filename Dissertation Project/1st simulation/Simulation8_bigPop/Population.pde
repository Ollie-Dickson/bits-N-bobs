
ArrayList<Animat> animats; // ArrayList of all the animats

class Population {
  //ArrayList<Animat> animats; // ArrayList of all the animats
  
  
  Population() {
    animats = new ArrayList<Animat>(); // Initialize the ArrayList
  }
  
  void run() {
    for (Animat a : animats) {
      //a.run(animats);
      a.run();
    }
  }
  
  void dayStart() {
    for (Animat a : animats) {
      a.dayStart();
    }
  }
  
  void saveData() {
    ani = 0;
    for (Animat a : animats) {
      
      
      
      TableRow row = table.addRow();
      
      //float data_v = a.maxspeed;
      row.setInt("Animat", ani);
      row.setFloat("Speed", a.maxspeed);
      row.setFloat("Size", a.size);
      row.setFloat("Population", animats.size());
      row.setInt("Day", day);
      
      row.setFloat("Meanspeed", meanspeed);
      row.setFloat("Meansize", meansize);
      ani++;
      if (save) {
      saveTable(table, "data/" + fileName + ".csv"); 
      save = false;
      }
      
      //loadData();
    }
  }
  
  void dayEnd() {
   // for (Animat a : animats) {
     for ( int i = animats.size() -1; i>=0; i--) {
      animats.get(i).dayEnd();
      
      if (animats.get(i).isDead) {
       animats.remove(i);
      }
    }
  }
  
  void addAnimat(Animat a) {
    animats.add(a);
  }
  
  void removeAnimat(Animat a) {
    animats.remove(a);
  }
  
  
}

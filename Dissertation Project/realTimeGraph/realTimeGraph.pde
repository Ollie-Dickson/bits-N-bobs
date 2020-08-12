Predator[] predators;
Prey[] prey;


PFont f;
Table table;


void setup() {
 size(1000,400);
 f = createFont("Courier", 32, true);
 
 loadData();
  
}



void draw() {
  background(255);
  
  for (int i = 0; i < predators.length;i++) {
   predators[i].display();
   prey[i].display();
 }
 
 for(float i=0;i<1000;i++) {
  stroke(0);
  strokeWeight(1);
  line(30,height-30,1000,height-30);
 }
  
  
  
}

void loadData() {
  table = loadTable("Experiment_1_3run5.csv","header");
  
  predators = new Predator[table.getRowCount()];
  prey = new Prey[table.getRowCount()];
  
  for (int i=0; i < table.getRowCount(); i++) {
   TableRow row = table.getRow(i);
   
   int predatorCount = row.getInt("predators");
   int preyCount = row.getInt("prey");
   int timeStep = row.getInt("timeStep");
   
   predators[i] = new Predator(timeStep,predatorCount);
   prey[i] = new Prey(timeStep,preyCount);
  }
  
  
}

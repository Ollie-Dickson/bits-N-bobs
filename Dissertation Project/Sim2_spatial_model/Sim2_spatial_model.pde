
Population population;


// enter output file name
String fileName = "Experiment_1_3run5";


int edgeSpace = 100;
float preyChance = 0.0025;
float predChance = 0.0006;

int prey_;
int predators_;

PFont f;
Table table;
int timeSteps = 0;
int endSim = 0;


void setup() {
  size(500, 500);
  population = new Population();
  frameRate(20);
  f = createFont("Courier", 32, true);
  table = loadTable("Experiment_0.csv","header");
  
  
}

void draw() {
  background(0,150,0);
  population.run();
  population.saveData();
  
  displayInfo();
  
  timeSteps++;
  if (predators_<=0) endSim++;
  if (endSim >= 100) {
    println("predator population reached 0");
    exit();
  }
}



void mousePressed() {
  population.addPrey(new Prey(mouseX,mouseY));
}

void displayInfo() {
  textFont(f);
    textAlign(LEFT);
    fill(255);
    
    textSize(24);
    text("prey: " + prey_ , 10, height-10);
    text("predators: " + predators_ , 10, height-40);
    text("time step: " + timeSteps , width/2, height-10);
    text("framerate: " + round(frameRate), width/2, height-40);
}

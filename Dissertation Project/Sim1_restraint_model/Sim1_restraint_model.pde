
Population population;


// enter output file name
String fileName = "Experiment_2_13";


// probability variables
float g = 0.012; // host reproductivity
float T = 0.13; // consumer transmissibility
float v = 0.15; // consumers demise

int hosts;
int consumers;

PFont f;
Table table;
int timeSteps = 0;


void setup() {
  size(800, 600);
  population = new Population();
  frameRate(24);
  f = createFont("Courier", 32, true);
  table = loadTable("Experiment_0.csv","header");
}

void draw() {
  background(255);
  
  population.generate();
  population.display();
  population.saveData();
  displayInfo();
  
  timeSteps++;
  
  if (keyPressed) {
    if (key == 's') {
      frameRate(0.5);
    }
  }
  if (keyPressed) {
    if (key == 'f') {
      frameRate(24);
    }
  }
}

void displayInfo() {
  textFont(f);
    textAlign(LEFT);
    fill(255);
    
    textSize(24);
    text("hosts: " + hosts , width/2, height-40);
    text("consumers: " + consumers , width/2, height-70);
    text("time step: " + timeSteps , width/2, height-10);
    text("framerate: " + round(frameRate), width/2, height-100);
}


Population population;

// enter output file name
String fileName = "Experiment_1";
// press 's' during run to save data at the end of the day

ArrayList<Food> food;
PFont f;
int time = 0;
int day = 1;
int dayLength = 400;
int foodMax = 500;
int popSize = 150;
float mutation = 0.1;

float maxenergy = 1200;
float foodenergy = 800;
float preyenergy = 1400;
float predatorscale = 1.2;

float meanspeed;
float meansize;

Table table;
int ani;
boolean save = false;

void setup() {
  size(800, 600);
  frameRate(250);
  table = loadTable("Experiment_0.csv","header");
  f = createFont("Courier", 32, true);
  population = new Population();
  food = new ArrayList<Food>();
  

  for (int i = 0; i <popSize; i++) {
    population.addAnimat(new Animat(random(0, 2800),color(150),2,12));
  }
  
  for (int i = 0; i<foodMax; i++) {
  food.add(new Food(new PVector(random(100,width-100), random(100,height-100))));
  }
  population.dayStart();
  meanValues();
  population.saveData(); 
}


void draw() {
  background(255);
  population.run();
  displayInfo();
  stroke(250,0,0);
  line((5*width/6),height-80,(5*width/6),height-70);
  line((5*width/6),height-100,(5*width/6),height-90);
  
  stroke(0,200,0);
  line((5*width/6)-36+meansize*3,height-101,(5*width/6)-36+meansize*3,height-94);
  line((5*width/6)-64+meanspeed*32,height-81,(5*width/6)-64+meanspeed*32,height-74);


  for (int i = 0; i < food.size(); i++) {
    Food f = food.get(i);
    //f.display();
    f.run();
    
    if (f.isEaten) {
      food.remove(i);
      i= i -1;
    }
  }
  
  if (time < dayLength) {
  time ++;
  } else {
  day = day + 1;
  time = 0;
  population.dayEnd();
  population.dayStart();
  meanValues();
  
  
  population.saveData(); 
  // delete remaining food
  for (int i = 0; i< food.size(); i++) {
    food.remove(i);
    i = i -1;
  }
  // generate more food for next day
  for (int i = 0; i<foodMax; i++) {
  food.add(new Food(new PVector(random(100,width-100), random(100,height-100))));
  }
  
  }
}


void displayInfo() {
    textFont(f);
    textAlign(LEFT);
    fill(0);
    
    
    textSize(18);
    //text("frames:   " + frameCount, width/4, height-100);
    text("framerate: " + round(frameRate), width/6, height-30);
    text("time: " + time, width/6, height-50);
    text("day: " + day, width/6, height-70);
    
    text("population: " + animats.size(), 4*width/6, height-50);
    text("food/day: " + foodMax, 4*width/6, height-30);
    text("maxspeeds: " , 4*width/6, height-70);
    text("sizes: " , 4*width/6, height-90);
    
    text("save: ", width/2-40, height-30);
    if (save) { fill(0,200,0); } else { fill(200,0,0); }
    stroke(0);
    rect(width/2+15,height-38,5,5);

}

void meanValues() {
  
  meanspeed = 0; // calculate mean values
  meansize = 0;
  for (Animat a : animats) {
    meanspeed = meanspeed + a.maxspeed;
    meansize = meansize + a.size;
  }
  meanspeed = meanspeed / animats.size();
  meansize = meansize / animats.size();
  
}



void keyPressed() {
  if (key == 's') {
    save = true;
  }
}

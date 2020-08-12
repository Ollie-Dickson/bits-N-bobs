
Population population;
ArrayList<Food> food;
PFont f;
int time = 0;
int day = 1;
int dayLength = 500;
int foodMax = 160;
int popSize = 50;
float mutation = 0.2;

float maxenergy = 1200;
float foodenergy = 600;
float preyenergy = 1200;
float predatorscale = 1.2;



void setup() {
  size(800, 600);
  frameRate(60);
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
}


void draw() {
  background(255);
  population.run();
  displayInfo();
  stroke(250,0,0);
  line((5*width/6),height-80,(5*width/6),height-70);
  line((5*width/6),height-100,(5*width/6),height-90);


  for (int i = 0; i < food.size(); i++) {
    Food f = food.get(i);
    f.display();
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

}

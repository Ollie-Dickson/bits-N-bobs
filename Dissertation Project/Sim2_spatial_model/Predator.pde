class Predator {
  
  float maxAge = 300;
  float maxEnergy = 600;
  float startEnergy = 375;
  float full = 380;
  float foodEnergy = 120;
  float birthCost = 320;
  float movementCost = 3.5;
  float crowdingFactor1 = 6; // breeding
  float crowdingFactor2 = 9; // hunting 
  float crowdingFactor3 = 8; // move away

  float x, y;
  float energy;
  float w;
  float age;
  boolean giveBirth = false;
  boolean eatPrey = false;
  boolean isDead = false;



  Predator(float x_, float y_) {
    x = x_;
    y = y_;
    w = 2;
    age = 0;


    energy = startEnergy;
  }

  //void run() {
  //  float[] mates = new float[8];
  //  mates = nearestMate();
  //  boolean crowded = checkCrowding(mates[4], mates[5],crowdingFactor1);
  //  // if well fed - breed with adjacent prey
  //  if ((energy > full)&&(!crowded)) {
  //    findMate(mates[6], mates[7]);
  //  // if hungry and not crowded - find prey
  //  } else { 
  //    crowded = checkCrowding(mates[4], mates[5], crowdingFactor2);
  //    if (!crowded) {
  //    float[] preyLoc = findPrey();
  //    if (eatPrey == false) {
  //     if (preyLoc[0] > x) x++;
  //     if (preyLoc[0] < x) x--;
  //     if (preyLoc[1] > y) y++;
  //     if (preyLoc[1] < y) y--;
  //     energy = energy - movementCost;
  //      }
  //    }
  //    }
  //    // if crowded - move away from predators
  //  crowded = checkCrowding(mates[4], mates[5], crowdingFactor3);
  //  if ((energy <= full) && (crowded)) {
  //    if (mates[0] > x) x--;
  //    if (mates[0] < x) x++;
  //    if (mates[1] > y) y--;
  //    if (mates[1] < y) y++;
  //    energy = energy - movementCost;
  //  } else if((energy > full) && (crowded)){
  //  float r = random(1);
  //  if (r < 0.25) x++;
  //  else if (r < 0.5) x--;
  //  else if (r < 0.75) y++;
  //  else y--;
  //  energy = energy - movementCost;
  //  }
    
  //  age++;
  
  //  eatPrey = false;
  //  if (energy > maxEnergy) energy = maxEnergy;
  //  if (age > maxAge) isDead = true;
  //  if (energy <= 0) isDead = true;
  //  render();
  //}
  
  
    void run() {
    float[] mates = new float[8];
    mates = nearestMate();
    boolean crowded = checkCrowding(mates[4], mates[5],crowdingFactor1);
    // if well fed - breed with adjacent prey
    if ((energy > full)&&(crowded == false)) {
      findMate(mates[6], mates[7]);
    // if hungry and not crowded - find prey
    } else { 
      crowded = checkCrowding(mates[4], mates[5], crowdingFactor2);
      if (!crowded) {
      float[] preyLoc = findPrey();
      if (eatPrey == false) {
       if (preyLoc[0] > x) x++;
       if (preyLoc[0] < x) x--;
       if (preyLoc[1] > y) y++;
       if (preyLoc[1] < y) y--;
       energy = energy - movementCost;
        }
      }
      }
      // if crowded - move away from predators
    crowded = checkCrowding(mates[4], mates[5], crowdingFactor3);
    if (crowded) {
      if (mates[0] > x) x--;
      if (mates[0] < x) x++;
      if (mates[1] > y) y--;
      if (mates[1] < y) y++;
      energy = energy - movementCost;
    } else {
    float r = random(1);
    if (r < 0.25) x++;
    else if (r < 0.5) x--;
    else if (r < 0.75) y++;
    else y--;
    }
    energy = energy - movementCost;
    age++;
  
    eatPrey = false;
    if (energy > maxEnergy) energy = maxEnergy;
    if (age > maxAge) isDead = true;
    if (energy <= 0) isDead = true;
    render();
  }

  
  


  void findMate(float mx, float my) {
    float mateX = mx;
    float mateY = my;

    if (dist(x, y, mateX, mateY) < 1.5) {
      giveBirth = true;
    } else {
      if (mateX > x) x++;
      if (mateX < x) x--;
      if (mateY > y) y++;
      if (mateY < y) y--;
      energy = energy - 2*movementCost;
    }
  }

  boolean checkCrowding(float tx, float ty, float f) {
    float tmateX = tx;
    float tmateY = ty;
    if (dist(x, y, tmateX, tmateY) < f) {
      return true;
    } else {
      return false;
    }
  }
  
  float[] findPrey() {
    float best = 2000;
    float d;
    float bestx = width/2;
    float besty = height/2;
    
    for (Prey other : prey) {
      d = dist(x, y, other.x, other.y);
      if ((d < best)&&(eatPrey==false)) {
        best = d;
        bestx = other.x;
        besty = other.y;
        if (d < 1.5 ) {
        other.isDead = true; 
        eatPrey = true;
        energy = energy + foodEnergy;
      } 
     }
    }
    
    float[] r = new float[2];
    r[0] = bestx;
    r[1] = besty;
    return r;
  }


// function that finds x and y of three nearest predators and nearest mate
  float[] nearestMate() {
    float best = 2000;
    float d;
    float bestx = width/2;
    float besty = height/2;
    float sbestx = bestx, tbestx = bestx;
    float sbesty = besty, tbesty = besty;
    float bestMatex = bestx;
    float bestMatey = besty;

    for (Predator other : predators) {
      d = dist(x, y, other.x, other.y);
      
      if ((d > 1.2)&&(d < best)&&(other.energy > full)) {
        tbestx = sbestx;
        tbesty = sbesty;
        sbestx = bestx;
        sbesty = besty;
        best = d;
        bestx = other.x;
        besty = other.y;
        bestMatex = bestx;
        bestMatey = besty;
      } else if ((d > 1.2)&&(d < best)) {
        tbestx = sbestx;
        tbesty = sbesty;
        sbestx = bestx;
        sbesty = besty;
        best = d;
        bestx = other.x;
        besty = other.y;
      }
      
    }

    float[] r = new float[8];
    r[0] = bestx;
    r[1] = besty;
    r[2] = sbestx;
    r[3] = sbesty;
    r[4] = tbestx;
    r[5] = tbesty;
    r[6] = bestMatex;
    r[7] = bestMatey;
    return r;
  }


  void newborns() {
    if (giveBirth == true) {
      float xn = x;
      float yn = y;
      float r = random(1);
      if (r < 0.25) xn++;
      else if (r < 0.5) xn--;
      else if (r < 0.75) yn++;
      else yn--;
      population.addPredator(new Predator(x, y));
      // population.addPrey(new Prey(x, y));
      energy = energy - birthCost;
      giveBirth = false;
    }
  }

   void wraparound() {
   if (x < -2) x = width;
   if (x > width+2) x = 0;
   if (y < -2) x = height;
   if (y > height+2) y = 0;
  }

  void render() {
   // fill(218,100,245); 
    fill(0);
    if(age>maxAge-50) fill(200,100,250);
    noStroke();
    rectMode(CENTER);
    rect(x, y, w, w);
  }
}

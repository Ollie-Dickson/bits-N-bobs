class Prey {
  
  float maxEnergy = 1000;
  float startEnergy = 500;
  float full = 300;
  float foodEnergy = 10;
  float movementCost = 2;
  float crowdingFactor = 5;
  float fleeChance = 0.45;
  float vision = 15;

  float x, y;
  float energy;
  float w;
  boolean giveBirth = false;
  boolean isDead = false;



  Prey(float x_, float y_) {
    x = x_;
    y = y_;
    w = 2;


    energy = startEnergy;
  }

  void run() {
    float[] mates = new float[6];
    mates = nearestMate();
    boolean crowded = checkCrowding(mates[4], mates[5]);
    // if well fed - breed with adjacent prey
    if ((energy > full)&&(!crowded)) {
      findMate(mates[0], mates[1]);
    // if hungry and not crowded - eat grass 
    } else { 
     crowded = checkCrowding(mates[2], mates[3]); 
     if (!crowded) {
        energy = energy + foodEnergy;
    // if hungry and crowded move away from adjacent prey
      } else {
        for (int i=0; i<2; i++) {
       if (mates[0] > x) x--;
       if (mates[0] < x) x++;
       if (mates[1] > y) y--;
       if (mates[1] < y) y++;
       energy = energy - 2*movementCost;
        }
      }
    }
    
    float r = random(1);
    if (r < fleeChance) {
    float[] threat = findPredator();
    if (dist(x, y, threat[0], threat[1]) < vision) {
       if (threat[0] > x) x--;
       if (threat[0] < x) x++;
       if (threat[1] > y) y--;
       if (threat[1] < y) y++;
     energy = energy - 2*movementCost;
    }
    }
    
    if (x < edgeSpace) { x++;
    } else if (x > width - edgeSpace) { x--;
    } else if (y < edgeSpace) { y++;
    } else if (y > height - edgeSpace) { y--;
    } else {
    r = random(1);
    if (r < 0.25) x++;
    else if (r < 0.5) x--;
    else if (r < 0.75) y++;
    else y--;
    }
    energy = energy - movementCost;
    
    
  //  wraparound();
   
    if (energy > maxEnergy) energy = maxEnergy;
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

  boolean checkCrowding(float tx, float ty) {
    float tmateX = tx;
    float tmateY = ty;
    if (dist(x, y, tmateX, tmateY) < crowdingFactor) {
      return true;
    } else {
      return false;
    }
  }
  
  float[] findPredator() {
    float best = 2000;
    float d;
    float bestx = width/2;
    float besty = height/2;
    
    for (Predator other : predators) {
      d = dist(x, y, other.x, other.y);
      if (d< best) {
        best = d;
        bestx = other.x;
        besty = other.y;
      }
    }
    float[] r = new float[2];
    r[0] = bestx;
    r[1] = besty;
    return r;
  }


// function that finds x and y of three nearest mates
  float[] nearestMate() {
    float best = 2000;
    float d;
    float bestx = width/2;
    float besty = height/2;
    float sbestx = bestx, tbestx = bestx;
    float sbesty = besty, tbesty = besty;

    for (Prey other : prey) {
      d = dist(x, y, other.x, other.y);
      //  if (d < 1.5) foundNeighbour = true;

      //  if (foundNeighbour == false) {
      if ((d > 1.2)&&(d < best)&&(other.energy > full)) {
        tbestx = sbestx;
        tbesty = sbesty;
        sbestx = bestx;
        sbesty = besty;
        best = d;
        bestx = other.x;
        besty = other.y;
      }
    }

    float[] r = new float[6];
    r[0] = bestx;
    r[1] = besty;
    r[2] = sbestx;
    r[3] = sbesty;
    r[4] = tbestx;
    r[5] = tbesty;
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
      population.addPrey(new Prey(x, y));
      // population.addPrey(new Prey(x, y));
      energy = energy - 500;
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
    fill(255); 
    if (energy > full) fill(200,0,0);
    noStroke();
    rectMode(CENTER);
    rect(x, y, w, w);
  }
}




class Animat {
  
  PVector pos;
  PVector vel;
  PVector acc;
  PVector home;
  PVector target;
  
  float maxforce;
  float maxspeed;
  float howfull;
  
  Animat(float initialPos) {
    if (initialPos < 800) {
      pos = new PVector(initialPos, 10);
      vel = new PVector(0,1);
    } else if (initialPos < 1400) {
      pos = new PVector(790, initialPos - 800);
      vel = new PVector(-1,0);
    } else if (initialPos < 2200) {
      pos = new PVector(initialPos - 1400, 590); 
      vel = new PVector(0,-1);
    } else {
      pos = new PVector(10, initialPos - 2200);
      vel = new PVector(1,0);
    }
    
    acc = new PVector(0,0);
    maxforce = 0.1;
    maxspeed = 2;
    home = new PVector(pos.x,pos.y);
    
  }
  
  
  //void run(ArrayList<Animat> animats) {
  void run() {
    //population(animats);
    
    if (isHungry == true) {
      target = nearestFood(food);
     } else if (time < 300 && howfull < 2) {
         target = nearestFood(food);
     }  else if (PVector.dist(home,pos) > 8) {
      target = home;
       } else {
      target = pos;
       }
     
     
    seek(target);
    update();
    render();
  }
  
  
  void render() {
      fill(175);
      stroke(0);
      ellipse(pos.x,pos.y,12,12);
      fill(255,0,0,100);
      ellipse(home.x,home.y,8,8);
    }
  
  //void population(ArrayList<Animat> animats) {
    
 // }
  
  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);
  }
  
  
  
  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acc.add(force);
  }
  
  
  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  void seek(PVector target) {
    PVector desired = PVector.sub(target,pos); // A vector pointing from the position to the target
    
    // Scale to maximum speed
    desired.setMag(maxspeed);
    
    // Steering = Desired minus velocity
    PVector steer = PVector.sub(desired,vel);
    steer.limit(maxforce);  // Limit to maximum steering force
    
    applyForce(steer);
  }
  
  
  PVector nearestFood (ArrayList<Food> food) {
    float best = 600;
    float d;
    PVector bestPos = new PVector(width/2,height/2);
    PVector thisguy;
    
    for (Food other : food) {
      d = PVector.dist(other.pos,pos);
      if (d < best) {
        best = d;
        bestPos = other.pos;
      }
    }
    if (food.size() < 1) {
      bestPos = home;
    }
    
    thisguy = bestPos;
    
    return thisguy;
  }
  
  
  
  
  
  boolean isHome() {
    if (PVector.dist(pos,home) < 8) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean isHungry;
  boolean isDead = false;
  
  void dayStart() {
     isHungry = true;
     howfull =0;
  }
  
  //void dayEnd(ArrayList<Animat> animats) {
  void dayEnd() {
    if (isHungry) {
      isDead = true;
    }
    if (isHome() == false) {
      isDead = true;
    }
  }
  
}

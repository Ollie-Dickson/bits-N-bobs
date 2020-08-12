


class Animat {
  
  PVector pos;
  PVector vel;
  PVector acc;
  PVector home;
  PVector target;
  color pigment;
  float mutation = 0.2;
  
  float desiredseparation = 1.0;
  
  float maxsep;
  float maxforce;
  float maxspeed;
  float howfull;
  float energy;
  float maxenergy=1300;
  float hometime = dayLength/4;
  
  Animat(float initialPos, color c, float s) {
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
    maxsep = 0.1;
    maxforce = 0.1;
    maxspeed = s;
    home = new PVector(pos.x,pos.y);
    pigment = c;
    energy = maxenergy;
  }
  
  
  //void run(ArrayList<Animat> animats) {
  void run() {
    //population(animats);
    
    if (energy > 0) {
    if (isHungry == true) {
      target = nearestFood(food);
     } else if (time < hometime && howfull < 2) {
         target = nearestFood(food);
     }  else if (PVector.dist(home,pos) > 8) {
      target = home;
       } else {
      target = pos;
       }
    } else {
      target = pos;
    }
     
    seek(target);
    seperate(animats);
    update();
    render();
  }
  
  
  void render() {
      fill(pigment);
      stroke(0);
      line((5*width/6)-64+maxspeed*32,height-80,(5*width/6)-64+maxspeed*32,height-70);
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
    energy = energy - vel.mag()*vel.mag();
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
  
  
  // Separation
  // Method checks for nearby boids and steers away
  void seperate (ArrayList<Animat> animats) {
    desiredseparation = 25.0;
    PVector steer = new PVector(0,0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Animat other : animats) {
      float d = PVector.dist(pos,other.pos);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(pos,other.pos);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxsep);
    }
    applyForce(steer);
  }
  
  
  
  
  
  boolean isHome() {
    if (PVector.dist(pos,home) < 12) {
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
     energy = 1000;
  }
  
  //void dayEnd(ArrayList<Animat> animats) {
  void dayEnd() {
    if (isHungry) {
      isDead = true;
    }
    if (isHome() == false) {
      isDead = true;
    }
    if (howfull >= 2) {
      float m = random(0,1);
      if (m < mutation) {
        maxspeed = maxspeed + random(-0.2,0.2);
        population.addAnimat(new Animat(random(0, 2800),color(150+320-160*maxspeed,150+320-160*maxspeed,150-320+160*maxspeed),maxspeed));
      } else {
        population.addAnimat(new Animat(random(0, 2800),color(150+320-160*maxspeed,150+320-160*maxspeed,150-320+160*maxspeed),maxspeed));
      }
      
    }
  }
  
}

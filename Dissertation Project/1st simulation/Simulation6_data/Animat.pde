


class Animat {
  
  PVector pos;
  PVector vel;
  PVector acc;
  PVector home;
  PVector target;
  color pigment;
  
  
  boolean isEaten = false;
  
  float desiredseparation = 15.0;
  
  float maxsep;
  float maxforce;
  float maxspeed;
  float size;
  float howfull;
  float energy;
  float hometime = dayLength/4;
  
  Animat(float initialPos, color c, float v, float s) {
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
    maxspeed = v;
    size =s;
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
    
    for (Animat other : animats) {
      if ((PVector.dist(pos,other.pos) < 7)&&(other.howfull<2)&&(size*predatorscale<other.size)
      &&(other.energy > 10)&&(isEaten == false)) {
        isEaten = true;
        other.isHungry = false;
        other.howfull ++;
        other.howfull ++;
        other.energy = other.energy + preyenergy;
      }
      
    }
     if (isEaten) {
       target = pos;
     }
     
    seek(target);
    seperate(animats);
    update();
    render();
  }
  
  
  void render() {
      fill(pigment);
      if (isEaten) {fill(200,0,0);}
      stroke(0);
      line((5*width/6)-64+maxspeed*32,height-80,(5*width/6)-64+maxspeed*32,height-76);
      stroke(pigment);
      line((5*width/6)-64+maxspeed*32,height-76,(5*width/6)-64+maxspeed*32,height-70);
      stroke(0);
      line((5*width/6)-36+size*3,height-100,(5*width/6)-36+size*3,height-90);
      ellipse(pos.x,pos.y,size,size);
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
    energy = energy - vel.mag()*vel.mag() - (size/8)*(size/8)*(size/8);
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
    for (Animat other : animats) {
      d = PVector.dist(other.pos,pos);
      if ((d < best)&&(other.size*predatorscale < size)&&(other.isEaten == false)) {
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
    if (PVector.dist(pos,home) < 14) {
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
     energy = maxenergy;
  }
  
  //void dayEnd(ArrayList<Animat> animats) {
  void dayEnd() {
    if (isHungry) {
      isDead = true;
    }
    if (isHome() == false) {
      isDead = true;
    }
    if ((howfull >= 2) && (isDead == false)) {
      float m = random(0,1);
      if (m < mutation) {
        float d = random(1);
        float newmaxspeed;
        float newsize;
        if (d < 0.5) {
        newmaxspeed = maxspeed + random(-0.1,0.1);
        newsize = size;
        } else {
        newsize = size + random(-1,1);
        newmaxspeed = maxspeed;
        }
        population.addAnimat(new Animat(random(0, 2800),color(150+320-160*newmaxspeed,
        150+320-160*newmaxspeed,150-320+160*newmaxspeed),newmaxspeed,newsize));
      } else {
        population.addAnimat(new Animat(random(0, 2800),color(150+320-160*maxspeed,
        150+320-160*maxspeed,150-320+160*maxspeed),maxspeed,size));
      }
      
    }
  }
  
  
}

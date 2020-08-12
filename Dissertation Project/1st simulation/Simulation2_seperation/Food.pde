class Food {
  PVector pos;
  boolean isEaten = false;
  
  Food(PVector p) {
    pos = p.get();
    
  }
  
  void run() {
    
    for (Animat other : animats) {
      if ((PVector.dist(pos,other.pos) < 5)&&(other.howfull<2)) {
        isEaten = true;
        other.isHungry = false;
        other.howfull ++;
      }
      
    }
  }
    
      
  
  
 
  
  void display() {
    stroke(0);
    strokeWeight(1);
    fill(0,127,0);
    ellipse(pos.x,pos.y,6,6);
  }
  
}

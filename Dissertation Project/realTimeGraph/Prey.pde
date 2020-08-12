
class Prey {
  
  int t,p;
  
  Prey(int t_, int p_) {
    t = t_/120;
    p = p_/20;
  }
  
  
  void display() {
    noStroke();
    fill(0,200,0);
    rectMode(CENTER);
    rect(30 + t, height -(30 + p),2,2);
    
  }
  
  
}

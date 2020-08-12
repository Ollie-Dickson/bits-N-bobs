
class Predator {
  
  int t,p;
  
  Predator(int t_, int p_) {
    t = t_/120;
    p = p_/20;
  }
  
  
  void display() {
    noStroke();
    fill(0);
    rectMode(CENTER);
    rect(30 + t, height -(30 + p),1,1);
    
  }
  
  
}

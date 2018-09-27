class Line {
  PVector loc; 
  int w; // linewidth
  int size;
  boolean o; // orientation
  
  Line(PVector loc, int w, int size, boolean o) {
    this.loc = loc;
    this.w = w;
    this.size = size;
    this.o = o;
  }
  
  void render() {
    fill(255);
    noStroke();
    if (o) {
      pushMatrix();
        translate(loc.x, loc.y);
        rotate(PI/4);
        ellipse(0,0, size+w, w/2);
      popMatrix();
    } else {
      pushMatrix();
        translate(loc.x, loc.y);
        rotate(-PI/4);
        ellipse(0,0, size+w, w/2);
      popMatrix();
    }
  }
}

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
        beginShape();
        vertex(-size/2, -size/2);
        vertex(w/2-size/2, -size/2);
        vertex(size/2, -w/2+size/2);
        vertex(size/2, size/2);
        vertex(-w/2+size/2, size/2);
        vertex(-size/2, w/2-size/2);
        endShape(CLOSE);
      popMatrix();
    } else {
      pushMatrix();
        translate(loc.x, loc.y);
        beginShape();
        vertex(size/2, -size/2);
        vertex(size/2, w/2-size/2);
        vertex(w/2-size/2, size/2);
        vertex(-size/2,size/2);
        vertex(-size/2, -w/2+size/2);
        vertex(-w/2+size/2, -size/2);
        endShape(CLOSE);
      popMatrix();
    }
  }
}

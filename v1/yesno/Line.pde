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
    quad(
      loc.x-size/2, loc.y-size/2,
      w+loc.x-size/2, loc.y-size/2,
      loc.x+w+size/2, loc.y+size/2,
      loc.x+size/2, loc.y+size/2
    );
    } else {
      quad(
        loc.x+size/2, loc.y-size/2,
        loc.x+w+size/2, loc.y-size/2,
        loc.x+w-size/2, loc.y+size/2,
        loc.x-size/2, loc.y+size/2
      );
    }
  }
}

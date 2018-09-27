class Line {
  PVector loc; 
  int w; // linewidth
  int size;
  boolean o; // orientation
  int line;
  
  Line(PVector loc, int w, int size, boolean o, int line) {
    this.loc = loc;
    this.w = w;
    this.size = size;
    this.o = o;
    this.line = line;
  }
  
  void render() {
    fill(255);
    noStroke();
    renderLine(line);
  }
  
  void renderLine(int num) {
    switch(num) {
      case 0:
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
    };
      case 1:
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
        };
      case 2:
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
         };
    }
  }
}

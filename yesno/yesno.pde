// spacebar to reset //<>//
int size;
Line[][] lines;
int i = 0;
int j = 0;
color backgroundColor = #1A07FF;

void setup() {
  size(800, 600);
  pixelDensity(2);
  background(backgroundColor);
  generateLines();
}

void generateLines() {
  size = round(random(20, 100));
  float fr = -size/3 + 50;
  println("frameRate: " + fr);
  frameRate(fr);
  lines = new Line[width/size+1][height/size+1];
  int line = floor(random(0,3));
  println(line);
  int w = 2;
  for (int i=0; i < lines.length; i++) {
    for (int j=0; j < lines[i].length; j++) {
      PVector loc = new PVector((i*size)+(size/2), (j*size)+(size/2));
      if (line == 0) {
         w = round(map(montecarlo(30), 0, 1, 100, 1));
      } else if (line == 2) {
        w = round(random(size/4, size/6));
      } else if (line == 1) {
        w = 2;
      }
      boolean o = random(1) > map(montecarlo(round(random(1,7))), 0, 1, .01, .99);
       
      lines[i][j] = new Line(loc, w, size, o, line);
    }
  }
}

void draw() {
  //draw a line per frame
  if (j < lines[i].length) {
    lines[i][j].render();
    i++;
    if (i == lines.length) {
      i = 0;
      j++;
    }
  }
  //reset when end
  if (j == lines[i].length-1 && i == lines.length-1) {
    reset();
  }
}

void reset() {
  generateLines();
  background(backgroundColor);
  i=0;
  j=0;
}

void keyPressed() {
  if (key == ' ') {
    reset();
  }
}

float montecarlo(int pow) {
  while (true) {
    float r1 = random(1);
    float p = r1;
    float r2 = random(1);
    if (r2 < pow(p, pow)) {
      return r1;
    }
  }
}

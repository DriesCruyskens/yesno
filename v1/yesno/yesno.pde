// spacebar to reset //<>//
int size = 50;
Line[][] lines;
int i = 0;
int j = 0;
color backgroundColor = #1A07FF;

void setup() {
  size(800, 600);
  pixelDensity(2);
  background(backgroundColor);
  frameRate(30);
  lines = new Line[width/size][height/size];
  generateLines();
}

void generateLines() {
  for (int i=0; i < lines.length; i++) {
    for (int j=0; j < lines[i].length; j++) {
      PVector loc = new PVector((i*size)+(size/2), (j*size)+(size/2));
      int w = round(map(montecarlo(30), 0, 1, 100, 1));
      boolean o = random(1) > random(.2, .8);
      lines[i][j] = new Line(loc, w, size, o);
    }
  }
}

void draw() {
  if (j < lines[i].length) {
    lines[i][j].render();
    i++;
    if (i == lines.length) {
      i = 0;
      j++;
    }
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

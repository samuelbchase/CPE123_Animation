void setup() {
  size(400, 400);
}

float Dist2D(float x1, float y1, float x2, float y2) {
  return  sqrt((x2 - x1)*(x2 - x1) + (y2 - y1)*(y2 - y1));
}

void draw() {
  if (Dist2D(0, 0, 0, 1) == 1) {
    println("Successful function");
  } else {
    println("Failed function");
  }
}
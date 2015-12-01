int[] array = {1, 2, 3, 4, 20, 0, 6, 200, 5000, 8};
int max;

void setup() {
  size(200, 200);
}

int FindMax(int[] array) {
  for (int i = 0; i < array.length; i++) {
    if (i == 0) {
      max = array[i];
    } else {
      if (max < array[i]) {
        max = array[i];
      }
    }
  }
  return max;
}

void draw() {
  println(FindMax(array));
}
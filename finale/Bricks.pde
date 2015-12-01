void drawBricks() {
  fill(#7C1606);
  for (int x=0; x< width; x++) {
    for (int y=0; y< height; y++) {
      rect(3+x*53-y*30, 3 +y*33, 50, 30);
    }
  }
}



void drawGround() {
  /*fill(#1C853C);
  rect(0, 470, 600, 200);*/
  for (int x=-10; x< width; x+=random (2, 5)) {
    for (int y=470; y< height; y++) {
      fill(random(20, 50), random(80, 200), random(0, 30));
      pushMatrix();
      translate(x, y);
      rotate(radians(30));
      rect(0, 0, 5, 20);
      popMatrix();
    }
  }
  fill(#481F11);
  quad(185, 490, 420, 490, 440, 550, 165, 550);
}

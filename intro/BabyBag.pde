void drawBabyBag(float bagX, float bagY, float leftCloudArm) {
  pushMatrix();
  //translate(290, 235);
  translate(bagX, bagY);
  rotate(leftCloudArm);
  translate(-300, -235);
  pushMatrix();
  translate(190, 250);
  scale(.9);
  translate(-162, -138);
  fill(#fef9dc);
  triangle(161, 55, 158, 40, 176, 45);
  triangle(131, 110, 162, 60, 193, 110);
  ellipse(162, 138, 80, 90);
  popMatrix();
  popMatrix();
}

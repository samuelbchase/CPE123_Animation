void drawHand(){
  pushMatrix();
  translate(290, 235);
  rotate(leftCloudArm);
  translate(-300, -235);
  fill(darkC);
  ellipse(190, 190, 30, 40);
  fill(lightC);
  ellipse(190, 188, 28, 38);
  popMatrix();
}

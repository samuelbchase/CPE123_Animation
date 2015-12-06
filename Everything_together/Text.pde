
void textContinue(int x, int y) {
  textAlign(CENTER);
  pushMatrix();
  translate(x, y);
  fill(20, 121, 108);
  rect(-250, -30,500,40);
  textSize(30);
  fill(255);
  text("Click anywhere to keep flying", 0, 0);
  popMatrix();
}


void textArrow(int x, int y) {
  textAlign(CENTER);
  pushMatrix();
  translate(x, y);
  textSize(30);
  fill(255);
  text("Use the up and down arrow keys to move stork", 0, 0);
  popMatrix();
}

void textKnock(int x, int y) {
  textAlign(CENTER);
  pushMatrix();
  translate(x, y);
  textSize(30);
  fill(255);
  text("Click the door to knock", 0, 0);
  popMatrix();
}


void textBag(int x, int y) {
  textAlign(CENTER);
  pushMatrix();
  translate(x, y);
  textSize(30);
  fill(255);
  text("Click the bag to see what's inside", 0, 0);
  popMatrix();
}
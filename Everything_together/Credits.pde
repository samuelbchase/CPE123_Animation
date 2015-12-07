void drawCredits(float y) {
  pushMatrix();
  translate(0, y);
  background(20, 121, 108);
  image(theEnd, 15, 150);
  pushMatrix();
  translate(300, 420);
  scale(2);
  translate(-300, -490);
  noStroke();
  gator(0);
  popMatrix();
  pushMatrix();
  translate(0, 800);
  textSize(80);
  fill(255);
  textAlign(CENTER);
  text("Animation By", 300, 0);
  text("Audrey", 300, 100); 
  text("Ben", 300, 200);
  text("Bonita", 300, 300);
  text("Sam", 300, 400);
  popMatrix();
  popMatrix();
}
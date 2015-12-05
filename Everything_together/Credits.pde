void drawCredits(float y) {
  pushMatrix();
  translate(0, y);
  background(20, 121, 108-.05*creditsCount);
  image(theEnd, 15, 100);
  pushMatrix();
  translate(300, 370);
  scale(2);
  translate(-300, -490);
  popMatrix();
  pushMatrix();
  translate(0,700);
  textSize(80);
  fill(#79EA3E);
  textAlign(CENTER);
  text("Animation By", 300,0);
  text("Audrey", 300, 100); 
  text("Ben", 300, 200);
  text("Bonita", 300, 300);
  text("Sam", 300, 400);
  popMatrix();
  popMatrix();
}
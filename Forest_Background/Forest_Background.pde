int forestTreeX = 0;
void treeMaker() //this makes lots of trees
{
  pushMatrix();
  noStroke();
  translate(forestTreeX, 600);
  forestTreeX+=49;
  fill(#5E2605);
  rect(0, 0, 10, -50);
  pushMatrix();
  fill(#006400);
  translate(5, -20);
  triangle(-20, 0, 0, -20, 20, 0);  
  translate(0, -10);
  triangle(-20, 0, 0, -20, 20, 0);  
  translate(0, -10);
  triangle(-20, 0, 0, -20, 20, 0);  
  translate(0, -10);
  triangle(-20, 0, 0, -20, 20, 0);  
  popMatrix();
  popMatrix();
}

void setup()
{
  size(600,600);
  
  for(int i = 0; i < 15; i++)
  {
    treeMaker();
  }
}
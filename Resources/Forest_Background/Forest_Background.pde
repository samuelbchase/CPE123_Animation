int forestTreeX = 0;
void treeMaker() //this makes lots of trees
{
  pushMatrix();
  noStroke();
  translate(forestTreeX, 600);
  forestTreeX+=20;
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
  
  
  pushMatrix();
  translate(10,-30);
   for(int i = 0; i < 31; i++)
  {
    treeMaker();
  }
  popMatrix();  
  forestTreeX=0;
  for(int i = 0; i < 30; i++)
  {
   treeMaker();
  }
  
  
}
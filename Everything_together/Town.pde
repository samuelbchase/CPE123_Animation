//town

void drawLawn()
{
 pushMatrix(); 
 noStroke();
 translate(0,525);
 fill(#78AB46); 
 rect(0,0,600,75);
 popMatrix();
}

void drawHouses()
{
  int counter =0;
  for(int i = 15; i < 600*100; i += 75)
  {
    pushMatrix(); //house base
    if(counter % 3 == 0)
    fill(0,0,128);
    else if(counter % 3 == 1)
    fill(#cc0909);
    else
    fill(#377c0c);
    translate(i,500);
    rect(0,0,50,50);
    
    pushMatrix(); //door
    translate(20,50);
    fill(#A68064);
    rect(0,0,10,-25);
    popMatrix();
    
    pushMatrix(); //roof
    fill(#4F2412);
    triangle(0,0,50,0,25,-15);
    popMatrix();
    
    popMatrix();
    counter++;
  }
}

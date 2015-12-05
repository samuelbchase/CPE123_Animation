//town
float HouseCounter = 0;
int colorcount;
//color[] bar = new color[60000];

void drawLawn()
{
 pushMatrix(); 
 noStroke();
 translate(0,525);
 fill(#78AB46); 
 rect(0,0,600,75);
 popMatrix();
}
/*
void setupColor()
{
for( int i = 0; i < 60000; i++)
{
 if(i % 3 ==0)
 {
   bar[i] = color(0,0,128);
 }
 else if(i % 3 ==1)
 {
   bar[i] = color(#cc0909);
 }
 else
 {
   bar[i] = color(#377c0c);
 }
}
} 
*/
void drawHouses()
{
  for(int i = 15; i < 600*100; i += 75)
  {
    pushMatrix();
    translate(-HouseCounter,0);
    pushMatrix(); //house base
    fill(color(0,0,128));
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
    popMatrix();
    colorcount++;
    HouseCounter+=.002;
  }
}
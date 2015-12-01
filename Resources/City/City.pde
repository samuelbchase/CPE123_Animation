int SamCityHeights[] = new int[100];
int SamCityWidths[] = new int[100];
int SamCityDistBetween[] = new int[100];
int SamCityRoofs[] = new int[100];
  int animation = 0;
  
void setup(){
size(600,600);
setupCity();

}

void setupCity()
{  
  //sets city heights. Run in setup
  for(int i = 0; i < 100; i++)
  {
    SamCityHeights[i] = 200 + int(random(0,300));
    SamCityWidths[i] = 20 + int(random(0,30));
    SamCityDistBetween[i] = 50 + int(random(0,10));
    SamCityRoofs[i] = 30 + int(random(0,30));

  }
}

void drawBuilding(int i,int x)
{
  fill(123,144,149);
  pushMatrix();  
  translate(SamCityDistBetween[i]+ 60*i - x - 20,600);
  rect(0,0,SamCityWidths[i],-SamCityHeights[i]);
  translate(SamCityWidths[i]/2,-SamCityHeights[i]);
  triangle(-SamCityRoofs[i]/2,0,SamCityRoofs[i]/2,0,0,-20);
  line(0,-20,0,-15+random(-20,0));
  popMatrix();
  
}

void draw()
{
  background(0);
  animation+=2;
  for(int i =0; i < 99; i++)
  {
    drawBuilding(i,animation); 
  }
}

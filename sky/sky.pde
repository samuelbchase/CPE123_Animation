int[] skyArrayBlue = new int[600*600];
int[] skyArrayRed = new int[600*600];
int[] skyArrayGreen = new int[600*600];


void setup()
{
  size(600, 600);
  prepArray();
}

void prepArray()
{
  if (skyArrayBlue[0] == 0)
  {
    for (int i = 0; i < width*height; i++)
    {
      skyArrayBlue[i] = 150 + (int)(random(0, 255-150));
    }
  }
  for (int i =0; i < width*height; i++)
  {
    skyArrayRed[i]=126;
    skyArrayGreen[i]=192;
  }
}

void drawSky()
{
  for (int i = 0; i < width*height; i++)
  {
    pushMatrix();
    noStroke();
    translate(i % width, i / height); 
    fill(skyArrayRed[i], skyArrayGreen[i], skyArrayBlue[i]); 
    ellipse(0, 0, random(10, 13), random(10, 13));
    popMatrix();
  }
}

void turnToNight()
{
  if(skyArrayRed[0] == 43 && skyArrayGreen[0] == 27 && skyArrayBlue[0] == 23)
  {
    
  }
  
  else if( skyArrayBlue[0] == 1 && skyArrayRed[0] == 180 && skyArrayGreen[0] == 102)
  {
    for (int i = 0; i < width*height; i++)
    {
      skyArrayRed[i] = 43;
      skyArrayGreen[i] = 27;
      skyArrayBlue[i] = 23;
    }
  }
  
  else
  {
    for (int i = 0; i < width*height; i++)
    {
      skyArrayRed[i] += 40;
      skyArrayGreen[i] = 102;
      skyArrayBlue[i] -= 40;
      if (skyArrayBlue[i] <= 0)
      {
        skyArrayBlue[i] = 1;
      }
      if (skyArrayRed[i] >= 180)
      {
        skyArrayRed[i] = 180;
      }
    }
  }
  
}

void draw()
{
  drawSky();
  turnToNight();
}

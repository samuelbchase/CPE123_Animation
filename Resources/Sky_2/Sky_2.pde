int[] skyArrayBlue = new int[600*600];
int[] skyArrayRed = new int[600*600];
int[] skyArrayGreen = new int[600*600];
int clouds = 10;
float cloudx[] = new float[clouds];
float cloudy[] = new float[clouds];
float cloudSize[] = new float[clouds];


void setup()
{
  size(600, 600);
  prepArray();
  for (int i=0; i<clouds; i++) {
    cloudx[i]= random(0, width);
    cloudy[i]= random(0, height);
    cloudSize[i]= random(.2, .6 );
  }
  frameRate(60);
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
  for (int i = 0; i < width; i++)
  {
    for (int y=0; y<height; y++) {
      pushMatrix();
      noStroke();
      // translate(i % width, i / height); 
      translate(i*10, y*30);
      fill(skyArrayRed[i], skyArrayGreen[i], skyArrayBlue[i]); 
      ellipse(0, 0, random(50, 53), random(50, 53));
      popMatrix();
    }
  }
}

void turnToNight()
{
  if (skyArrayRed[0] == 43 && skyArrayGreen[0] == 27 && skyArrayBlue[0] == 23)
  {
  } else if ( skyArrayBlue[0] == 1 && skyArrayRed[0] == 180 && skyArrayGreen[0] == 102)
  {
    for (int i = 0; i < width*height; i++)
    {
      skyArrayRed[i] = 43;
      skyArrayGreen[i] = 27;
      skyArrayBlue[i] = 23;
    }
  } else
  {
    for (int i = 0; i < width*height; i++)
    {
      skyArrayRed[i] += 23;
      skyArrayGreen[i] = 25;
      skyArrayBlue[i] -= 23;
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

void drawCloud(float x, float y, float size) {
  pushMatrix();
  translate (x, y);
  scale(size);
  translate(-200, -250);
  noStroke();
  fill(255);
  ellipse(200, 180, 200, 100);
  fill(150);
  ellipse(200, 210, 80, 80);
  fill(255);
  ellipse(200, 207, 77, 77);
  fill(150);
  ellipse(262, 202, 100, 100);
  fill(255);
  ellipse(260, 198, 97, 97);
  fill(150);
  ellipse(261, 160, 68, 68);
  ellipse(77, 173, 120, 80);
  ellipse(140, 200, 85, 90);
  fill(255);
  ellipse(258, 159, 70, 70);
  ellipse(228, 132, 50, 50);
  ellipse(100, 130, 95, 95);
  ellipse(160, 130, 100, 60);
  ellipse(82, 171, 118, 79);
  ellipse(142, 196, 85, 90);
  fill(150);
  ellipse(65, 210, 100, 70);
  fill(255);
  ellipse(65, 206, 100, 70);
  fill(150);
  ellipse(17, 190, 50, 50);
  fill(255);
  ellipse(19, 187, 50, 50);
  popMatrix();
}

void draw() {

  drawSky();
  turnToNight();

  for (int i=0; i<clouds; i++) {
    drawCloud(cloudx[i], cloudy[i], cloudSize[i]);
  }
}
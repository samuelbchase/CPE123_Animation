int clouds = 10;
int stars = 80;
float starx[] = new float[stars];
float stary[] = new float[stars];
float cloudx[] = new float[clouds];
float cloudy[] = new float[clouds];
float cloudSize[] = new float[clouds];
float cloudO=.2;
float cloudT;
float skycount=1;


void setup() {
  size(600, 600);
  for (int i=0; i<clouds; i++) {
    cloudx[i]= random(0, width);
    cloudy[i]= random(0, height);
    cloudSize[i]= random(.2, .6 );
  }
  for (int i=0; i<stars; i++) {
    starx[i]= random(0, width);
    stary[i]= random(0, height);
  }
}




void draw() {
  drawSky();
}
//Interactive Animation by Bonita Galvan, Ben Troller, Sam Chase and Audrey Gerughty
color darkC = color(150, 150, 150);
color lightC = color(211, 211, 211);
int clouds = 20;
float cloudx[] = new float[clouds];
float cloudy[] = new float[clouds];
float cloudSize[] = new float[clouds];
int cloudT=255;
float leftCloudArm=0;
boolean leftCloudArmR= true;
float rightCloudArm=0;
boolean rightCloudArmR= true;
int end = 1;
int secondaryCounter = 1;
int i = 0;
float craneX, craneY, craneR, craneHeadR, craneNeckR, wingScale, craneLegR, bagX, bagY, cloudEyeX, cloudEyeY;
float cloudmanx, cloudmanvx, cloudmany, cloudmanvy, cloudmanSize, cloudmanSizeV;
int houseCounter = 0;
color houseColor[] = new color [60000];
PFont text;
float craneButtonHeight = 0;
float tumbleWeedX = 0;
float tumbleWeedRotate = 0;
float tumbleWeedRadius[] = new float[20];
float tumbleWeedOffset[] = new float[20];
import processing.sound.*;
SoundFile music, credits;

void setup() {
  music = new SoundFile(this, "credits.mp3");
  music.play();
  text = loadFont("Giddehand-48.vlw");
  size(600, 700);
  wingScale = 0;
  smooth();
  prepGround();
  //setupColor();
  clickDoor = false;
  for (int i=0; i<clouds; i++) {
    cloudx[i]= random(-width, width*2);
    cloudy[i]= random(0, height);
    cloudSize[i]= random(.2, .6 );
  }
  cloudmanx=390;
  cloudmany=147;
  cloudmanvx=-2;
  cloudmanvy=-.1;
  cloudmanSize=1;
  craneX = -170;
  catx=300;
  caty=700;
  catvy=-60;
  catvx=-2;
  parentSize=1;
  parentsy=300;
  parentsvy=.4;

  noStroke();  
  for (int i = 0; i < numberOfCacti; i++) {
    if (i > 0) {
      cactusX[i] = cactusX[i - 1] + random(20, 200);
    }
  }
  for (int i = 0; i < numberOfCacti; i++) {
    cactusHeight[i] = random(2000, 4000);
  }
  for (int i = 0; i < numberOfCacti; i++) {
    cactusScale[i] = random(0.1, 0.13);
  }
  for (int i = 0; i < 100; i++) {
    if (i == 0) {
      shaleHeight[i] = random(100, 300);
    } else if (shaleHeight[i - 1] < 100) {
      shaleHeight[i] = shaleHeight[i - 1] + random(10, 50);
    } else if (shaleHeight[i - 1] > 450) {
      shaleHeight[i] = shaleHeight[i - 1] - random(10, 50);
    } else {
      shaleHeight[i] = random(-100, 100) + shaleHeight[i - 1];
    }
  }
  //TREE STUFF
  for (int i = 0; i < randomTreeHeights.length; i++) {
    randomTreeHeights[i] = random(0, 200);
    randomTreeOffsets[i] = random(-10, 10);
    treeColor[i] = color(random(0, 60), random(50, 150), random(0, 60));
  }
  for (int i = 0; i < 60000; i++) {
    houseColor[i] = color(random(70, 210), random(50, 240), random(80, 230));
  }
  //initialize tumbleweed variables
  for (int i = 0; i < 20; i++) {
    if (i == 0) {
      tumbleWeedOffset[i] = 0;
    } else {
      tumbleWeedOffset[i] = tumbleWeedOffset[i - 1] - random(600, 1500);
    }
    tumbleWeedRadius[i] = random(15, 35);
  }
  setupCity();
  theEnd = loadImage("TheEnd.png");
  theEnd.loadPixels();

  //initialize tumbleweed variables
  for (int i = 0; i < 20; i++) {
    if (i == 0) {
      tumbleWeedOffset[i] = 0;
    } else {
      tumbleWeedOffset[i] = tumbleWeedOffset[i - 1] - random(600, 1500);
    }
    tumbleWeedRadius[i] = random(15, 35);
  }
}

void draw() {  
//beginning scene
  if (i < 570) {
    background(#65B5F5); 
    noStroke();
    for (int i=0; i<clouds; i++) {
      drawCloud(cloudx[i]+cloudmanx*.65, cloudy[i], cloudSize[i]);
    }
    drawCloudMan();
    drawBabyBag(bagX, bagY, leftCloudArm);
    drawHand();
    if (i>=257) {
      if (rightCloudArm < -.2) {
        rightCloudArmR = false;
      } 
      if (rightCloudArm > .2) {
        rightCloudArmR = true;
      }

      if (rightCloudArmR == true) {
        rightCloudArm -= .008;
      } else {
        rightCloudArm += .008;
      }
      cloudmanx=cloudmanx+cloudmanvx;
      cloudmany=cloudmany+cloudmanvy;
      cloudmanSize=cloudmanSize*.998;
    }
    if (leftCloudArm < -.2) {
      leftCloudArmR = false;
    } 
    if (leftCloudArm > .2) {
      leftCloudArmR = true;
    }

    if (leftCloudArmR == true) {
      leftCloudArm -= .005;
    } else {
      leftCloudArm += .005;
    }
    if (i<180) {
      craneX = 100;
      craneY = 300;
      craneR = radians(280);
      craneHeadR  = radians(-10);
      bagX = 290;
      bagY = 235;
      craneLegR = radians(290);
      cloudEyeX = 370;
      cloudEyeY = 96;
      craneNeckR = 0;
      crane(craneX, craneY, craneR, craneHeadR, wingScale, craneLegR, craneNeckR);
    } else if (i<260) { //crane begins to fly
      if (secondaryCounter % 2 == 0) {
        wingScale = 50;
      } else {
        wingScale = 170;
      }
      craneX = 150+end/2;
      craneY = 300;
      craneR = radians(280)+ (radians(i-180));
      craneHeadR  = radians(-10)- (radians(i-180));
      bagX = craneX+170+70* (cos(radians(280)+ (radians(i-180))));
      bagY = craneY+45+70* (sin(radians(280)+ (radians(i-180))));
      craneLegR =0;
      leftCloudArm = 0;
      crane(craneX, craneY, craneR, craneHeadR, wingScale, craneLegR, craneNeckR);
      end++;
      if (end % 7 == 0) {
        secondaryCounter++;
      }
    } else { //wings flap
      if (secondaryCounter % 2 == 0) {
        wingScale = 50;
      } else {
        wingScale = 170;
      }
      craneX = 150+(i-260)*2;
      craneY = 300+craneButtonHeight+ 10*cos(radians(end));
      craneR = cos(radians(end))*.1;
      craneHeadR  = radians(-84)+cos(radians(end))*.1;
      bagX = craneX+250;
      bagY = craneY+cos(radians(end))*18+63;
      craneLegR =0;
      leftCloudArm = 0;
      cloudEyeX = 370+1*(i-260)/100;
      cloudEyeY = 97+1*(i-260)/400;
      crane(craneX, craneY, craneR, craneHeadR, wingScale, craneLegR, craneNeckR);
      end++;
      if (end % 7 == 0) {
        secondaryCounter++;
      }
    }
    i++;
    //println(flyingCounter);
  } 
//Flying scenes
    else if (craneHasLooped < 4) {
    drawForestScene();
    textBox();
    textContinue(300, 650);
    //if (craneHasLooped == 1) {
    //  drawForestScene();} else
    if (craneHasLooped == 1) {
      drawDesertScene();
      textBox();
      textArrow(300, 670);
    } else if (craneHasLooped == 2) {
      drawCityScene();
      textBox();
      textArrow(300, 670);
    } else if (craneHasLooped == 3) {
      background(#7ec0ee);
      drawLawn();
      drawHouses();
      textBox();
      textArrow(300, 670);
    }

    craneFlying();

    if (craneX >= 760 ) {
      craneX = -170;
    }
    if (craneX == 750) {
      craneHasLooped++;
    }
  } 
//Ending scene
    else {
    drawAllTheHouse();
    if (houseCounter<10) {
      //crane standing
      wingScale = 0;
      craneX = 210;
      craneY = 420;
      craneR = radians(280);
      craneHeadR  = radians(-10);
      craneNeckR = 0;
      bagX = craneX+55;
      bagY = craneY-8;
      craneLegR = radians(290);
    } else if (houseCounter<18) {
      //crane sets down bag
      craneNeckR = (radians(houseCounter-10))*4;
      craneHeadR = (radians(-10)- (radians(houseCounter-10))*4);
      bagX = craneX+42+76*(cos(radians(280)+ 4*(radians(houseCounter-10))));//should be 300, 490 at end
      bagY = craneY+67+76*(sin(radians(280)+ 4*(radians(houseCounter-10))));
    } else if (houseCounter<25) {
      //crane lifts head back up
      craneNeckR = (radians(houseCounter-25))*-4;
      craneHeadR = (radians(-10)- (radians(houseCounter-25))*-4);
      bagX = 300;//should be ~300, 490 at end
      bagY = 428.8+9.8*(houseCounter-18);
    } else if (houseCounter<30) {
      //crane rotates from standing to flying position
      if (houseCounter % 2 == 0) {
        wingScale = 50;
      } else {
        wingScale = 170;
      }
      craneX = 210+(houseCounter-25)*5;
      craneY = 420-(houseCounter-25)*2;
      craneR = radians(280)+ 8*(radians(houseCounter-25));
      craneHeadR  = radians(-10)- 8*(radians(houseCounter-25));
    } else if (houseCounter<133) {
      //crane flying
      if (houseCounter % 2 == 0) {
        wingScale = 50;
      } else {
        wingScale = 170;
      }
      craneX = 235+(houseCounter-30)*20;
      craneY = 410-(houseCounter-30)*12;
      craneHeadR  = radians(-84)+cos(radians(houseCounter))*.1;
      craneLegR =0;
    }
    i++;
    println(i);
    drawBabyBag(bagX, bagY);
    crane(craneX, craneY, craneR, craneHeadR, wingScale, craneLegR, craneNeckR);
    houseCounter++;
  }
}
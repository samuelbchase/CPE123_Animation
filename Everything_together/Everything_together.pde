//Interactive Animation by Bonita Galvan, Ben Troller, Sam Chase and Audrey Gerughty
color darkC = color(150, 150, 150);
color lightC = color(211, 211, 211);
int clouds = 10;
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

void setup() {
  size(600, 600);
  wingScale = 0;
  smooth();
  prepGround();
  //setupColor();
  clickDoor = false;
  for (int i=0; i<clouds; i++) {
    cloudx[i]= random(0, width);
    cloudy[i]= random(0, height);
    cloudSize[i]= random(.2, .6 );
  }
  cloudmanx=390;
  cloudmany=147;
  cloudmanvx=-2;
  cloudmanvy=-.1;
  cloudmanSize=1;
  craneX = -170;
  catx=250;
  caty=600;
  catvy=-18;
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
    cactusHeight[i] = random(600, 3000);
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
    randomTreeHeights[i] = random(0, 300);
    randomTreeOffsets[i] = random(-10, 10);
  }
  setupCity();
}

void draw() {
  if (i < 860) {
    background(#65B5F5); 
    noStroke();
    for (int i=0; i<clouds; i++) {
      drawCloud(cloudx[i], cloudy[i], cloudSize[i]);
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
    } else if (i<260) {
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
    } else {
      if (secondaryCounter % 2 == 0) {
        wingScale = 50;
      } else {
        wingScale = 170;
      }
      craneX = 150+(i-260);
      craneY = 300+ 10*cos(radians(end));
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
    println(i);
  } else if (craneHasLooped < 5) {
    if (craneHasLooped == 1) {
      drawForestScene();
    } else if (craneHasLooped == 2) {
      drawDesertScene();
    } else if (craneHasLooped == 3) {
      drawCityScene();
    } else if (craneHasLooped == 4) {
      background(#7ec0ee);
      drawLawn();
      drawHouses();
    }

    craneFlying();

    if (craneX > 750 ) {
      craneX = -170;
    }
    if (craneX >= 750) {
      craneHasLooped++;
    }
  } else {
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
    } else if (houseCounter<35) {
      //crane rotates from standing to flying position
      /* if (i % 2 == 0) {
       wingScale = 50;
       } else {
       wingScale = 170;
       }*/
      craneX = 210;
      craneY = 420;
      craneR = radians(280)+ 4*(radians(houseCounter-25));
      craneHeadR  = radians(-10)- 4*(radians(houseCounter-25));
    } else if (houseCounter<133) {
      //crane flying
      if (houseCounter % 2 == 0) {
        wingScale = 50;
      } else {
        wingScale = 170;
      }
      craneX = 210+(houseCounter-33)*10;
      craneY = 420-(houseCounter-33)*6;
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
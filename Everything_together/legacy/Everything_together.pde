color darkC = color(150, 150, 150);
color lightC = color(211, 211, 211);
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
float leftCloudArm=0;
boolean leftCloudArmR= true;
int end = 1;
int secondaryCounter = 1;
int i = 0;
float craneX, craneY, craneR, craneHeadR, craneNeckR, wingScale, craneLegR, bagX, bagY, cloudEyeX, cloudEyeY;

int houseCounter = 0;

void setup() {
  size(600, 600);
  wingScale = 0;
  smooth();
  clickDoor = false;
  for (int i=0; i<clouds; i++) {
    cloudx[i]= random(0, width);
    cloudy[i]= random(0, height);
    cloudSize[i]= random(.2, .6 );
  }
  for (int i=0; i<stars; i++) {
    starx[i]= random(0, width);
    stary[i]= random(0, height);
  }
  craneX = -170;

  noStroke();  
  for (int i = 0; i < numberOfCacti; i++) {
    if (i > 0) {
      cactusX[i] = cactusX[i - 1] + random(20, 200);
    }
  }
  for (int i = 0; i < numberOfCacti; i++) {
    cactusHeight[i] = random(600, 3000);
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
  if (i < 1350) {
    background(#65B5F5); 
    noStroke();
    // drawSky();
    drawCloudMan();
    drawBabyBag(bagX, bagY, leftCloudArm);
    drawHand();

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
      craneX = 150+end/2;
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
  } else if (craneHasLooped < 4) {
    if (craneHasLooped == 1) {
      drawForestScene();
    } else if (craneHasLooped == 2) {
      drawDesertScene();
    } else if (craneHasLooped == 3) {
      drawCityScene();
    }

    craneFlying();

    //i++;
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
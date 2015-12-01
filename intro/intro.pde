color darkC = color(150, 150, 150);
color lightC = color(211, 211, 211);
float leftCloudArm=0;
boolean leftCloudArmR= true;
int end = 1;
int secondaryCounter = 1;
int i = 0;
float craneX, craneY, craneR, craneHeadR, wingScale, craneLegR, bagX, bagY, cloudEyeX, cloudEyeY;

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(#65B5F5); 
  noStroke();

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
    crane(craneX, craneY, craneR, craneHeadR, wingScale, craneLegR);
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
    crane(craneX, craneY, craneR, craneHeadR, wingScale, craneLegR);
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
    crane(craneX, craneY, craneR, craneHeadR, wingScale, craneLegR);
    end++;
    if (end % 7 == 0) {
      secondaryCounter++;
    }
  }
  i++;
  println(i);
}


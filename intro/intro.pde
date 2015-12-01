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
  size(600, 600);
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
void crane(float craneX, float craneY, float craneR, float craneHeadR, float wingScale, float craneLegR) {
  pushMatrix();
  ///*
  translate(craneX, craneY);
  rotate(craneR);
  scale(.6);
  rotate(radians(80));
  translate(-84, -186);
  //*/
  //body
  fill(#fef9dc);
  pushMatrix();
  translate(84, 194);
  rotate(radians(19));
  ellipse(0, 0, 56, 151);
  popMatrix();
  //right leg top
  fill(#ef5723);
  pushMatrix();
  translate(68, 260);
  rotate(radians(37));
  rect(0, 0, 8, 36);
  popMatrix();
  
  
  //right leg bottom
  pushMatrix();
  translate(46, 289);
  rotate(radians(57));
  translate(-50, -287);
  quad(55, 280, 128, 319, 126, 324, 48, 290);
  popMatrix();
  //right foot
  pushMatrix();
  translate(60, 370);
  rotate(radians(50));
  translate(-60, -370);
  pushMatrix();
  translate(61, 370);
  rotate(radians(0));
  ellipse(0, 0, 20, 5);
  popMatrix();
  pushMatrix();
  translate(60, 376);
  rotate(radians(30));
  ellipse(0, 0, 20, 5);
  popMatrix();
  pushMatrix();
  translate(56, 380);
  rotate(radians(60));
  ellipse(0, 0, 20, 5);
  popMatrix();
  popMatrix();
  
  
  //left leg top
  pushMatrix();
  translate(55, 260);
  rotate(radians(30));
  rect(0, 0, 8, 36);
  popMatrix();
  
  //rotate leg to standing
  pushMatrix();
  translate(37, 290);
  rotate(craneLegR);
  translate(-37, -290);
  //left leg bottom
  pushMatrix();
  translate(37, 290);
  rotate(radians(0));
  rect(0, 0, 6, 90);
  popMatrix();
  
  //left foot
  pushMatrix();
  translate(48, 380);
  rotate(radians(50));
  translate(-50, -380);
  pushMatrix();
  translate(47, 380);
  rotate(radians(0));
  ellipse(0, 0, 20, 5);
  popMatrix();
  pushMatrix();
  translate(46, 386);
  rotate(radians(30));
  ellipse(0, 0, 20, 5);
  popMatrix();
  pushMatrix();
  translate(40, 386);
  rotate(radians(60));
  ellipse(0, 0, 20, 5);
  popMatrix();
  popMatrix();
  popMatrix();
  //neck 
  fill(#fef9dc);
  noFill();
  strokeWeight(18);
  stroke(#fef9dc);
  arc(114, 48, 50, 105, radians(130), radians(180));
  arc(85, 135, 50, 105, radians(310), radians(360));
  noStroke();
  //head rotation
  pushMatrix();
  translate(96, 40);
  rotate(craneHeadR);
  translate(-96, -40);
  //head
  fill(#fef9dc);
  ellipse(96, 36, 30, 30);
  //beak top
  fill(#ef5723);
  beginShape();
  vertex(96, 40);
  vertex(102, 38);
  vertex(105, 35);
  vertex(107, 30);
  vertex(108, 27);
  vertex(196, 74);
  endShape(CLOSE);
  //beak bottom
  pushMatrix();
  translate(134, 54);
  rotate(radians(-13));
  translate(-130, -64);
  triangle(96, 40, 176, 93, 98, 50);
  fill(#e07e2f);
  triangle(96, 40, 112, 46, 176, 93);
  popMatrix();
  //eye
  fill(255);
  ellipse(98, 30, 10, 10);
  //pupil
  fill(0);
  ellipse(100, 31, 4, 6);
  //bag
  /*fill(#fef9dc);
   triangle(161, 55, 158, 40, 176, 45);
   triangle(131, 110, 162, 60, 193, 110);
   ellipse(162, 138, 80, 90);*/
  popMatrix();
  //wing
  fill(#fef9dc);
  ellipse(125, 202, wingScale, 70);
  ellipse(50, 174, wingScale, 70);
  popMatrix();
}
void drawCloudMan() {
  pushMatrix();
  translate(290, 235);
  rotate(leftCloudArm);
  translate(-300, -235);
  //left arm
  fill(darkC);
  ellipse(290, 235, 70, 90); //left arm
  ellipse(245, 220, 60, 80); //left arm
  fill(lightC);
  ellipse(285, 230, 70, 90); //left arm
  ellipse(240, 215, 60, 80); //left arm 
  popMatrix();
 
 fill(darkC);
  rect(305, 150, 180, 250, 300);
  fill(lightC);
  rect(300, 150, 180, 250, 300);
  fill(darkC);
  ellipse(393, 135, 190, 170);//head
  fill(lightC);
  ellipse(390, 130, 190, 170); //head
  fill(darkC);
  ellipse(435, 143, 60, 50); //cheek 
  fill(lightC);
  ellipse(432, 146, 60, 50); //cheek
  fill(darkC);
  ellipse(395, 190, 92, 102); //chin shadow 
  ellipse(140, 482, 80, 80);
  ellipse(400, 485, 150, 105);
  fill(lightC);
  ellipse(300, 460, 500, 70);
  ellipse(145, 478, 80, 80);
  ellipse(400, 480, 150, 100);
  fill(darkC);
  ellipse(72, 430, 120, 120);
  ellipse(253, 468, 175, 175);
  ellipse(498, 475, 85, 85);
  ellipse(538, 429, 90, 90);
  ellipse(435, 383, 160, 140);
  fill(lightC);
  ellipse(392, 185, 90, 100); //chin
  ellipse(75, 420, 120, 120);
  ellipse(250, 460, 170, 170);
  ellipse(495, 470, 80, 80);
  ellipse(535, 425, 90, 90);
  ellipse(430, 385, 160, 140);
  ellipse(350, 390, 100, 100);
  ellipse(270, 380, 130, 130);
  ellipse(180, 390, 150, 150);

  for (int i=0; i<5; i++) {
    fill(darkC);
    pushMatrix();
    translate(523+i*2, 197+i*3);
    rotate(radians(i*30));
    ellipse(0, 0, 15, 90);
    popMatrix();
    fill(lightC);
    pushMatrix();
    translate(520+i*2, 197+i*3);
    rotate(radians(i*30));
    ellipse(0, 0, 15, 90);
    popMatrix();
  }
  fill(darkC);
  ellipse(390, 140, 100, 80);
  ellipse(485, 250, 70, 90); //right arm
  ellipse(515, 220, 60, 80); //right arm
  fill(lightC);
  ellipse(480, 245, 70, 90); //right arm
  ellipse(510, 215, 60, 80); //right arm 
  fill(darkC, 200);
  ellipse(370, 95, 50, 40);
  ellipse(410, 95, 50, 40); 
  fill(255);
  ellipse(376, 95, 30, 30);
  ellipse(404, 95, 30, 30);
  
  //make eyes move!!cloudEyeX,Y = 370, 96
  fill(#55118E);
  ellipse(cloudEyeX, cloudEyeY, 15, 15);
  ellipse(cloudEyeX+27, cloudEyeY-2, 15, 15);
  
  fill(255);
  ellipse(cloudEyeX+5, cloudEyeY-3, 5, 5);
  ellipse(cloudEyeX+31, cloudEyeY-5, 5, 5);
  fill(lightC);
  ellipse(390, 137, 96, 76); //nose
  pushMatrix();
  translate(395, 187);
  rotate(radians(-20));
  fill(0);
  arc(0, 0, 75, 50, radians(0), radians(180));
  fill(lightC);
  arc(0, -5, 75, 35, radians(0), radians(180));
  popMatrix();
}

void drawBabyBag(float bagX, float bagY, float leftCloudArm) {
  pushMatrix();
  //translate(290, 235);
  translate(bagX, bagY);
  rotate(leftCloudArm);
  translate(-300, -235);
  pushMatrix();
  translate(190, 250);
  scale(.9);
  translate(-162, -138);
  fill(#fef9dc);
  triangle(161, 55, 158, 40, 176, 45);
  triangle(131, 110, 162, 60, 193, 110);
  ellipse(162, 138, 80, 90);
  popMatrix();
  popMatrix();
}
void drawHand(){
  pushMatrix();
  translate(290, 235);
  rotate(leftCloudArm);
  translate(-300, -235);
  fill(darkC);
  ellipse(190, 190, 30, 40);
  fill(lightC);
  ellipse(190, 188, 28, 38);
  popMatrix();
}


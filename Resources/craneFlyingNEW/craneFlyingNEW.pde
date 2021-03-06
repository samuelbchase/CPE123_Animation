//<<<<<<< HEAD:Resources/craneFlying/craneFlying.pde
int end = 1;
//=======
int flyingCounter = 1;
//>>>>>>> origin/master:Resources/craneFlyingNEW/craneFlyingNEW.pde
int secondaryCounter = 1;
int i = 0;
float craneX, craneY, craneR, craneHeadR, wingScale, craneLegR;
void setup() {
  noStroke();
  smooth();
  size(600, 600);
}
void draw() {
//<<<<<<< HEAD:Resources/craneFlying/craneFlying.pde
    if (i<100) {
      background(12, 34, 56);
      craneX = 200;
      craneY = 400;
      craneR = radians(280);
      craneHeadR  = radians(-10);
      //craneLegR = 
      crane(craneX, craneY, craneR, craneHeadR, wingScale);
    } else {
      background(12, 34, 56);
      if (secondaryCounter % 2 == 0) {
        wingScale = 50;
      } else {
        wingScale = 170;
      }
      craneX = 200+end;
      craneY = 400+ 10*cos(radians(end));
      craneR = cos(radians(end))*.1;
      craneHeadR  = radians(-84)+cos(radians(end))*.1;
      crane(craneX, craneY, craneR, craneHeadR, wingScale);
      end++;
      if (end % 7 == 0) {
        secondaryCounter++;
      }      
    }
  i++;
//=======
  if (i<300) {
    craneStanding();
  } else {
    craneFlying();
  }
  i++;
}

void craneStanding() {
  background(12, 34, 56);
  craneX = 200;
  craneY = 400;
  craneR = radians(280);
  craneHeadR  = radians(-10);
  //craneLegR = 
  crane(craneX, craneY, craneR, craneHeadR, wingScale);
}

void craneFlying() {
  background(12, 34, 56);
  if (secondaryCounter % 2 == 0) {
    wingScale = 50;
  } else {
    wingScale = 170;
  }
  craneX = flyingCounter;
  craneY = 200+ 10*cos(radians(flyingCounter));
  craneR = cos(radians(flyingCounter))*.1;
  craneHeadR  = radians(-84);
  crane(craneX, craneY, craneR, craneHeadR, wingScale);
  flyingCounter++;
  if (flyingCounter % 7 == 0) {
    secondaryCounter++;
  }
//>>>>>>> origin/master:Resources/craneFlyingNEW/craneFlyingNEW.pde
}

void crane(float craneX, float craneY, float craneR, float craneHeadR, float wingScale) {
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
  rect(0, 0, 6, 36);
  popMatrix();
  //right leg bottom
  pushMatrix();
  translate(37, 290);
  rotate(radians(0));
  rect(0, 0, 6, 90);
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
  rect(0, 0, 6, 36);
  popMatrix();
  //left leg bottom
  pushMatrix();
  translate(41, 289);
  rotate(radians(57));
  translate(-50, -287);
  quad(55, 280, 128, 319, 126, 324, 48, 290);
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
  //neck HELP ME!!!!
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
  fill(#fef9dc);
  triangle(161, 55, 158, 40, 176, 45);
  triangle(131, 110, 162, 60, 193, 110);
  ellipse(162, 138, 80, 90);
  popMatrix();
  //wing
  ellipse(125, 202, wingScale, 70);
  ellipse(50, 174, wingScale, 70);
  popMatrix();
}

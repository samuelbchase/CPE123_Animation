int numberOfCacti = 100;
float cactusHeight[] = new float[numberOfCacti];
float cactusX[] = new float[numberOfCacti];
float cactusY = 150;
int shaleCounter = 0;
float shaleHeight[] = new float[100];

boolean mouseWasClicked = false;
int flyingCounter = 1;
int secondaryCounter = 1;
int i = 0;
float craneX, craneY, craneR, craneHeadR, wingScale, craneLegR;

void setup() {
  noStroke();
  smooth();
  size(600, 600);
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
}

void draw() {
  background(244, 209, 138);
  fill(71, 24, 106);
  pushMatrix();
  translate(-shaleCounter, 0);
  beginShape();
  vertex(0, 600);
  for (int i = 0; i < 100; i++) {
    vertex(80*i + shaleHeight[i]/20, shaleHeight[i]);
  }
  vertex(400, 6*600);
  endShape(CLOSE);
  popMatrix();
  for (int i = 0; i < numberOfCacti; i++) {
    drawACactus(cactusX[i], cactusHeight[i], 0.1);
  }
  stroke(0);
  strokeWeight(1);
  cactusPositionUpdate();
  shaleCounter++;

  //ground
  fill(225, 126, 53);
  rect(0, 580, width, 20);

  craneFlying();

  i++;
}

void drawACactus(float x, float y, float scale) {
  pushMatrix();
  translate(x, height);
  scale(scale);
  translate(-225, -y);
  cactusBody(y);
  maracas();
  popMatrix();
}

void maracas() {
  pushMatrix();
  translate(85, 320);
  rotate(random(radians(-30), radians(30)));
  fill(#83620D); 
  ellipse(0, 10, 10, 80);
  fill(255, 0, 0);
  ellipse(0, -5, 35, 50);
  popMatrix();
  pushMatrix();
  translate(365, 320);
  rotate(random(radians(-30), radians(30)));
  fill(#83620D); 
  ellipse(0, 10, 10, 80);
  fill(255, 0, 0);
  ellipse(0, -5, 35, 50);
  popMatrix();
}

//cacti's actual height is cactusHeight - 50
void cactusBody(float height) {
  noStroke();
  fill(#D1A639); //sombrero brown
  ellipse(225, 200, 300, 100);
  rect(75, 140, 300, 60);
  fill(#4DF01D); // cactus green 
  rect(125, cactusY, 200, height - cactusY, 90, 90, 10, 10);
  rect(60, 280, 50, 80, 90, 90, 10, 10);
  rect(60, 330, 100, 50, 90);
  rect(340, 280, 50, 80, 90, 90, 10, 10);
  rect(290, 330, 100, 50, 90);
  fill(#D1A639); //sombrero brown
  ellipse(225, 170, 250, 60);
  rect(185, 50, 80, 100, 200, 200, 0, 0);
  quad(185, 80, 265, 80, 290, 140, 160, 140);
  stroke(#83620D); //dark brown sombrero
  strokeWeight(3);
  arc(225, 170, 250, 60, radians(30), radians(150));
  stroke(#0E6717); //green highlights
  strokeWeight(6);
  noFill();
  arc(225, 143, 130, 30, radians(180), radians(360));
  strokeWeight(3);
  arc(185, 270, 45, 20, radians(190), radians(350));
  arc(265, 270, 45, 20, radians(190), radians(350));
  strokeWeight(6);
  fill(#83620D);
  arc(117, 140, 85, 30, radians(0), radians(180));
  arc(333, 140, 85, 30, radians(0), radians(180));
  stroke(0);
  strokeWeight(4);
  fill(255);
  arc(185, 260, 30, 80, radians(180), radians(360));
  arc(265, 260, 30, 80, radians(180), radians(360));
  noStroke();
  fill(0);
  arc(225, 300, 50, 120, radians(0), radians(180));
  arc(185, 260, 20, 50, radians(180), radians(360));
  arc(265, 260, 20, 50, radians(180), radians(360));
  fill(#FC9EFC); // tounge
  pushMatrix();
  translate(220, 340);
  rotate(radians(-25));
  ellipse(0, 0, 15, 30);
  popMatrix();
  for (int i=0; i<10; i++) {
    pushMatrix();
    fill(255, 0, 0);
    noStroke();
    translate(90+i*30, 165);
    rotate(radians(45));
    rect(0, 0, 12, 12);
    popMatrix();
  }
  for (int i=0; i<4; i++) {
    pushMatrix();
    fill(255, 0, 0);
    noStroke();
    translate(180+i*30, 105);
    rotate(radians(45));
    rect(0, 0, 12, 12);
    popMatrix();
  }
}

//remember to call
void cactusPositionUpdate() {
  for (int i = 0; i < numberOfCacti; i++) {
    cactusX[i] -= 2;
  }
}

//CRANE STUFF

void craneStanding() {
  //background(12, 34, 56);
  craneX = 200;
  craneY = 400;
  craneR = radians(280);
  craneHeadR  = radians(-10);
  //craneLegR = 
  crane(craneX, craneY, craneR, craneHeadR, wingScale);
}

void craneFlying() {
  //background(12, 34, 56);
  if (secondaryCounter % 2 == 0) {
    wingScale = 50;
  } else {
    wingScale = 170;
  }
  if (flyingCounter < 180) {
    craneX++;
  } else if (mouseWasClicked) {
    craneX++;
  }
  craneY = 200+ 10*cos(radians(flyingCounter));
  craneR = cos(radians(flyingCounter))*.1;
  craneHeadR  = radians(-84);
  crane(craneX, craneY, craneR, craneHeadR, wingScale);
  flyingCounter++;
  if (flyingCounter % 7 == 0) {
    secondaryCounter++;
  }
}

void crane(float craneX, float craneY, float craneR, float craneHeadR, float wingScale) {
  noStroke();
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

void mouseClicked() {
  mouseWasClicked = true;
}
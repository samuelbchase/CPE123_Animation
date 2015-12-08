int numberOfCacti = 100;
float cactusHeight[] = new float[numberOfCacti];
float cactusX[] = new float[numberOfCacti];
float cactusY = 150;
int shaleCounter = 0;
float shaleHeight[] = new float[100];
float cactusScale[] = new float [numberOfCacti];

int mouseWasClicked = 0;
int flyingCounter = 1;

int craneHasLooped = 0;

int SamCityHeights[] = new int[100];
int SamCityWidths[] = new int[100];
int SamCityDistBetween[] = new int[100];
int SamCityRoofs[] = new int[100];
int animation = 0;
float starYPositions[] = new float[600];
int roadStripePositions[] = new int[20];

int forestTreeX = 0;
int treeCounter = 0;
float randomTreeHeights[] = new float[300];
float randomTreeOffsets[] = new float[300];
color treeColor[] = new color [300];


void drawDesertScene() {
  background(244, 209, 138);
  for (int i=0; i<clouds; i++) {
    drawCloud(cloudx[i]-width, cloudy[i], cloudSize[i]);
  }
  fill(244, 209, 138, 80);
  rect(0, 0, 600, 600);
  fill(71, 24, 106);
  pushMatrix();
  translate(-shaleCounter, 0);
  beginShape();
  vertex(-20, 600);
  for (int i = 0; i < 100; i++) {
    vertex(80*i + shaleHeight[i]/20, shaleHeight[i]);
  }
  vertex(400, 6*600);
  endShape(CLOSE);
  popMatrix();
  for (int i = 0; i < numberOfCacti; i++) {
    if (cactusX[i] > -100 && cactusX[i] < 700) {
      drawACactus(cactusX[i], cactusHeight[i], cactusScale[i]);
    }
  }
  stroke(0);
  strokeWeight(1);
  cactusPositionUpdate();
  shaleCounter++;

  //ground
  noStroke();
  fill(225, 126, 53);
  rect(0, 580, width, 20);
  //tumbleweeds
  for (int i = 0; i < 20; i++) {
    if (tumbleWeedX + tumbleWeedOffset[i] + tumbleWeedRadius[i] > 0 && tumbleWeedX + tumbleWeedOffset[i] - tumbleWeedRadius[i] < 600) {
      drawTumbleWeed(tumbleWeedX + tumbleWeedOffset[i], radians(tumbleWeedRotate), tumbleWeedRadius[i]);
    }
  }
  tumbleWeedX += 4;
  tumbleWeedRotate += 12;
}

void drawTumbleWeed(float tumbleWeedX, float tumbleWeedRotate, float tumbleWeedScale) {
  pushMatrix();
  translate(tumbleWeedX, 580-tumbleWeedScale);
  rotate(tumbleWeedRotate);
  float xc = 0, yc = 0;
  for (int i = 0; i < 2900; i += 1) {
    xc = 0 + tumbleWeedScale*cos((2*(radians(i)/5)))*cos(radians(i));
    yc = 10 + tumbleWeedScale*cos((2*(radians(i)/5)))*sin(radians(i));
    noStroke();
    fill(229, 170, 87);
    ellipse(xc, yc, tumbleWeedScale/20, tumbleWeedScale/20);
  }
  popMatrix();
}

void drawAllTumbleWeeds() {
  for (int i = 0; i < 20; i++) {
    if (tumbleWeedX + tumbleWeedOffset[i] + tumbleWeedRadius[i] > 0 && tumbleWeedX + tumbleWeedOffset[i] - tumbleWeedRadius[i] < 600) {
      drawTumbleWeed(tumbleWeedX + tumbleWeedOffset[i], radians(tumbleWeedRotate), tumbleWeedRadius[i]);
    }
  }
  tumbleWeedX += 1.7;
  tumbleWeedRotate += 2;
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

void craneFlying() {
  noStroke();
  drawBabyBag(bagX, bagY);
  if (secondaryCounter % 2 == 0) {
    wingScale = 50;
  } else {
    wingScale = 170;
  }
  if (flyingCounter < 200 ) {
    craneX+=2;
  } else if (mouseWasClicked >= 1) {
    craneX+=2;
  }
  craneY = 300+ craneButtonHeight+ 10*cos(radians(flyingCounter));
  craneR = cos(radians(flyingCounter))*.1;
  craneHeadR  = radians(-84)+cos(radians(flyingCounter))*.1;
  bagX = craneX+138+(cos(radians(flyingCounter)))*-2;
  bagY = craneY+13+cos(radians(flyingCounter))*18+63;
  craneLegR =0;
  leftCloudArm = 0;
  cloudEyeX = 370+1*(flyingCounter-260)/100;
  cloudEyeY = 97+1*(flyingCounter-260)/400;
  noStroke();
  crane(craneX, craneY, craneR, craneHeadR, wingScale, craneLegR, craneNeckR);
  flyingCounter++;
  if (flyingCounter % 7 == 0) {
    secondaryCounter++;
  }
}

void mouseClicked() {
  mouseWasClicked++;
}

void setupCity()
{  
  //sets city heights. Run in setup
  for (int i = 0; i < 100; i++)
  {
    SamCityHeights[i] = 200 + int(random(0, 300));
    SamCityWidths[i] = 20 + int(random(0, 30));
    SamCityDistBetween[i] = 50 + int(random(0, 10));
    SamCityRoofs[i] = 3 + int(random(0, 30));
    if (SamCityRoofs[i] < SamCityWidths[i])
    {
      SamCityRoofs[i] = SamCityWidths[i]-5;
    }
  }
  for (int i = 0; i < 600; i++) {
    starYPositions[i] = random(0, 600);
  }
  for (int i = 0; i < 20; i++) {
    roadStripePositions[i] = 2*i * 620/40;
  }
}

void drawBuilding(int i, int x)
{
  fill(#5D6571);
  pushMatrix();  
  translate(SamCityDistBetween[i]+ 70*i - x - 20, 550);
  rect(0, 0, SamCityWidths[i], -SamCityHeights[i]);
  fill(#323840);
  quad(0+SamCityWidths[i], 0, 0+SamCityWidths[i], -SamCityHeights[i], 15+SamCityWidths[i], -SamCityHeights[i]+20, 15+SamCityWidths[i], 0);
  for (int w=0; w<2; w++) {
    for (int y=0; y<12; y++) {
      fill(#F1FCAB);
      rect(SamCityWidths[i]/5+w*SamCityWidths[i]/3, -10-y*SamCityHeights[i]*.08, SamCityWidths[i]/5, -SamCityHeights[i]*.05);
    }
  }
  fill(#5D6571);
  translate(SamCityWidths[i]/2, -SamCityHeights[i]);
  triangle(-SamCityRoofs[i]/2, 0, SamCityRoofs[i]/2, 0, 0, -20);
  int counter = 1;
  for (float j = 0; j > .90; j-=.01)
  {
    pushMatrix();
    translate(counter, 0);
    counter++;
    scale(i);
    triangle((int)-SamCityRoofs[i]/2, 0, (int)SamCityRoofs[i]/2, 0, 0, -20);
    popMatrix();
  }
  line(0, -20, 0, -15+random(-20, 0));
  popMatrix();
}


void treeMaker(float treeHeight, float treeOffset, color treeColor) { //this makes lots of trees
  pushMatrix();
  noStroke();
  translate(forestTreeX + treeOffset, 600 - treeHeight);
  forestTreeX+=20;
  fill(#5E2605);
  rect(0, treeHeight, 10, -treeHeight - 50);
  pushMatrix();
  fill(treeColor);
  translate(5, -20);
  triangle(-40, 0, 0, -40, 40, 0);  
  for (int i = 0; i < treeHeight/10 + 1; i++) {
    translate(0, -12);
    triangle(-40+i, 0, 0, -40+i, 40-i, 0);
  }
  //translate(0, -10);
  //triangle(-20, 0, 0, -20, 20, 0);  
  //translate(0, -10);
  //triangle(-20, 0, 0, -20, 20, 0);  
  popMatrix();
  popMatrix();
}

void drawCityScene() {
  background(0);
  for (int i = 0; i < 600; i++) {
    fill(random(235, 255), random(250, 255), random(180, 255));
    ellipse(i, starYPositions[i], random(1, 2), random(1, 2));
  }
  animation+=2;
  for (int i =0; i < 99; i++)
  {
    drawBuilding(i, animation);
  }
  fill(0);
  rect(0, 550, width, 50);
  fill(200, 200, 0);
  for (int i = 0; i < 20; i++) {
    rect(roadStripePositions[i], 572, 620/40, 5);
    roadStripePositions[i] -= 2;
    if (roadStripePositions[i] < -10) {
      roadStripePositions[i] = 610;
    }
  }
}

void drawForestScene() {
  background(71, 183, 251);
  for (int i=0; i<clouds; i++) {
    drawCloud(cloudx[i]-width, cloudy[i]-150, cloudSize[i]);
  }
  forestTreeX=0;
  pushMatrix();
  translate(-treeCounter*2, 0);
  for (int i = 0; i < 300; i++)
  {
    treeMaker(randomTreeHeights[i], randomTreeOffsets[i], treeColor[i]);
  }
  popMatrix();
  treeCounter++;
  fill(109, 69, 33);
  rect(0, 587, width, 50);
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP&&craneY>100) {
      craneButtonHeight-=10;
    } else if (keyCode == DOWN&&craneY<350) {
      craneButtonHeight+=10;
    }
  } else {
  }
}
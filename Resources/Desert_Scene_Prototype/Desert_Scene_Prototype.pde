int numberOfCacti = 100;
float cactusHeight[] = new float[numberOfCacti];
float cactusX[] = new float[numberOfCacti];
float cactusY = 150;
int shaleCounter = 0;
float shaleHeight[] = new float[100];
float cactusScale[] = new float [numberOfCacti];

float tumbleWeedX = 0;
float tumbleWeedRotate = 0;
float tumbleWeedRadius[] = new float[20];
float tumbleWeedOffset[] = new float[20];

void setup() {
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
    shaleHeight[i] = random(100, 300);
  }
  for (int i = 0; i < numberOfCacti; i++) {
    cactusScale[i] = random(0.1, 0.13);
  }
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
    drawACactus(cactusX[i], cactusHeight[i], cactusScale[i]);
  }
  stroke(0);
  strokeWeight(1);
  cactusPositionUpdate();
  shaleCounter++;

  //ground
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
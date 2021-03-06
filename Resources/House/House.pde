float dx=420;
float dy=90;
float dy2=460;
float dwx=400;
float dw=30;
float dvw=.6;
float dvx=15;
float dvxw=14.2;
float dvy=2;
int BabyBagX =300;
int MoveCrane=0;
float craneX, craneY, craneR, craneHeadR, wingScale, craneLegR;
boolean clickDoor;
boolean clickBabyBag;


void setup() {
  smooth();
  size (600, 600);
  clickDoor = false;
}

void mousePressed() {
  if (mouseX > 185 & mouseX < 420 & mouseY > 90 & mouseY <460 ) {
    clickDoor = true;
  }
  if (clickDoor ==true && (mouseX-300)*(mouseX-300) + (mouseY-490)*(mouseY-490) - 1600 <0) {
    clickBabyBag = true;
  }
}


void draw() {
  drawAllTheHouse();
  crane(120+MoveCrane,330,radians(280),radians(-10), 0);
}

void drawAllTheHouse() {
  noStroke();
  fill(178, 104, 61);
  rect(0, 0, width, height);
  drawBricks();
  fill(#B27865);
  rect(150, 50, 300, 423);
  drawGround();
  if (clickDoor) {
    drawParents();
  }
  drawDoor();
  if (clickDoor) {
    dx= dx- dvx;
    dy= dy+ dvy;
    dy2= dy2 - dvy;
    dw= dw - dvw;
    dwx= dwx - dvxw;
    drawBabyBag(0,490);
    MoveCrane=1000;
  }
  if (clickBabyBag == true) {
    gator();
    BabyBagX=1000;
  }
  if (dx <= 210) {
    dvx=0;
    dvy=0;
    dvxw=0;
    dvw=0;
  }
}
  
void crane(float craneX, float craneY, float craneR, float craneHeadR, float wingScale) {
  pushMatrix();
  ///*
  translate(craneX, craneY);
  rotate(craneR);
  scale(1);
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
  /*//bag
  fill(#fef9dc);
  triangle(161, 55, 158, 40, 176, 45);
  triangle(131, 110, 162, 60, 193, 110);
  ellipse(162, 138, 80, 90);
  popMatrix();*/
  drawBabyBag(-122,138);
  //wing
  ellipse(125, 202, wingScale, 70);
  ellipse(50, 174, wingScale, 70);
  popMatrix();
  popMatrix();
}





void gator() {
  pushMatrix();
  translate(300, 490);
  scale(.3);
  translate(-300, -200);
  //spikes on back
  fill(#fef9dc);
  ellipse(300, 300, 460, 120);
  fill(#517A46);
  ellipse(330, 119, 37, 42);
  ellipse(389, 121, 42, 43);
  ellipse(440, 151, 28, 35);
  ellipse(472, 172, 32, 19);
  beginShape();
  vertex(276, 136);
  vertex(318, 103);
  vertex(340, 103);
  vertex(351, 113);
  vertex(380, 101);
  vertex(406, 108);
  vertex(422, 134);
  vertex(438, 133);
  vertex(454, 149);
  vertex(458, 168);
  vertex(478, 163);
  vertex(489, 171);
  vertex(500, 184);
  vertex(464, 205);
  endShape(CLOSE);
  //base
  fill (123, 185, 106);
  ellipse(344, 206, 233, 186);
  ellipse(70, 155, 74, 69);
  ellipse(159, 86, 68, 119);
  ellipse(207, 94, 82, 139);
  ellipse(445, 240, 64, 82);
  pushMatrix();
  translate(500, 211);
  rotate(radians(-44));
  ellipse(0, 0, 96, 41);
  popMatrix();
  pushMatrix();
  translate(454, 292);
  rotate(radians(23));
  ellipse(0, 0, 40, 19);
  popMatrix();
  pushMatrix();
  translate(438, 304);
  rotate(radians(14));
  ellipse(0, 0, 49, 20);
  popMatrix();
  ellipse(408, 316, 84, 24);
  pushMatrix();
  translate(338, 328);
  rotate(radians(-18));
  ellipse(0, 0, 77, 25);
  popMatrix();
  pushMatrix();
  translate(304, 320);
  rotate(radians(-13));
  ellipse(0, 0, 76, 23);
  popMatrix();
  pushMatrix();
  translate(286, 308);
  rotate(radians(-10));
  ellipse(0, 0, 75, 23);
  popMatrix();
  pushMatrix();
  translate(168, 314);
  rotate(radians(18));
  ellipse(0, 0, 68, 27);
  popMatrix();
  pushMatrix();
  translate(197, 305);
  rotate(radians(15));
  ellipse(0, 0, 68, 27);
  popMatrix();
  pushMatrix();
  translate(218, 295);
  rotate(radians(25));
  ellipse(0, 0, 65, 18);
  popMatrix();
  ellipse(154, 286, 55, 67);
  ellipse(82, 194, 54, 29);
  beginShape();
  vertex(87, 124);
  vertex(94, 126);
  vertex(104, 122);
  vertex(116, 112);
  vertex(130, 58);
  vertex(234, 42);
  vertex(254, 80);
  vertex(269, 101);
  vertex(285, 114);
  vertex(306, 118);
  vertex(441, 156);
  vertex(462, 173);
  vertex(476, 180);
  vertex(490, 184);
  vertex(504, 182);
  vertex(536, 166);
  vertex(537, 177);
  vertex(534, 190);
  vertex(472, 240);
  vertex(446, 280);
  vertex(443, 303);
  vertex(323, 330);
  vertex(239, 304);
  vertex(170, 302);
  vertex(141, 258);
  vertex(118, 236);
  vertex(102, 225);
  vertex(70, 207);
  endShape(CLOSE);
  //left eye
  fill(255);
  pushMatrix();
  translate(136, 90);
  rotate(radians(18));
  ellipse(0, 0, 56, 83);
  popMatrix();
  //left pupil
  fill(0);
  pushMatrix();
  translate(143, 78);
  rotate(radians(16));
  ellipse(0, 0, 47, 55);
  popMatrix();
  //nose
  fill (123, 185, 106);
  beginShape();
  vertex(133, 131);
  vertex(143, 123);
  vertex(149, 115);
  vertex(157, 99);
  vertex(176, 154);
  endShape(CLOSE);
  //right eye
  fill(255);
  pushMatrix();
  translate(194, 98);
  rotate(radians(19));
  ellipse(0, 0, 72, 89);
  popMatrix();
  //right pupil
  fill (0);
  pushMatrix();
  translate(186, 90);
  rotate(radians(0));
  ellipse(0, 0, 54, 54);
  popMatrix();
  pushMatrix();
  translate(190, 85);
  rotate(radians(20));
  ellipse(0, 0, 54, 62);
  popMatrix();
  //cheek
  fill (123, 185, 106);
  pushMatrix();
  translate(217, 145);
  rotate(radians(-11));
  ellipse(0, 0, 63, 33);
  popMatrix();
  //smile
  noFill();
  stroke(#517A46);
  strokeWeight(2);
  arc(80, 178, 60, 30, 2*PI/8, 6*PI/8);
  arc(124, 203, 60, 40, 10*PI/8, 14*PI/8);
  arc(174, 164, 80, 70, 0, 6*PI/8);
  arc(214, 178, 48, 30, 10*PI/8, 14*PI/8);
  //throat
  arc(204, 215, 180, 120, 2*PI/8, 6*PI/8);
  //feet
  arc(190, 320, 130, 80, 11*PI/8, 14*PI/8);
  popMatrix();
  noStroke();
}

void drawBricks() {
  fill(#7C1606);
  for (int x=0; x< width; x++) {
    for (int y=0; y< height; y++) {
      rect(3+x*53-y*30, 3 +y*33, 50, 30);
    }
  }
}

void drawDoor() {
  fill(#E8ECF2);
  beginShape();
  vertex(0, 480);
  vertex(0, 450);
  vertex(150, 450);
  vertex(150, 50);
  vertex(450, 50);
  vertex(450, 450);
  vertex(600, 450);
  vertex(600, 480);
  vertex(420, 480);
  vertex(420, 80);
  vertex(180, 80);
  vertex(180, 480);
  endShape();
  fill(#9DA4AF);
  quad(0, 445, 150, 445, 150, 450, 0, 450);
  quad(450, 445, 600, 445, 600, 450, 450, 450);
  fill(#89909B);
  quad(147, 55, 150, 55, 150, 480, 147, 480);
  quad(447, 47, 450, 47, 450, 480, 447, 480);
  triangle(300, 50, 447, 47, 450, 50);
  beginShape();
  vertex(180, 480);
  vertex(180, 80);
  vertex(420, 80);
  vertex(420, 95);
  vertex(185, 95);
  vertex(185, 480);
  endShape();

  fill(#3D5481);
  quad(185, 90, dx, dy, dx, dy2, 185, 460); //main blue
  fill(255, 209, 23);
  ellipse(dwx, 280, dw, 30); // door knob

  //window frame 
  stroke(#E8ECF2);
  strokeWeight(14);
  fill(#B27865);
  rect(480, 80, 300, 200); //window frame
  line(480, 180, 780, 180); //window line
  line(600, 80, 600, 280);
  noStroke();
  fill(#7C0734);
  arc(487, 87, 173, 173, radians(0), radians(90)); //curtain
  arc(487, 273, 100, 173, radians(-90), radians(0));
  //cat 
  pushMatrix();
  translate(487, 187);
  strokeWeight(1);
  noStroke();
  fill(#F2720F);
  quad(30, 20, 70, 20, 75, 87, 25, 87);
  //rect(30, 20, 40, 67, 10, 10, 0, 0);
  triangle(30, 20, 40, 20, 30, 5);
  triangle(60, 20, 70, 20, 70, 5);
  fill(255);
  ellipse(43, 40, 10, 10);
  ellipse(57, 40, 15, 15);
  fill(0);
  ellipse(43, 42, 3, 3);
  ellipse(57, 42, 4, 4);
  fill(#FA5DD8);
  triangle(45, 50, 55, 50, 50, 56);
  stroke(0);
  line (20, 45, 45, 50);//whiskers
  line (20, 50, 45, 50);
  line (20, 55, 45, 50);
  line (80, 45, 55, 50);
  line (80, 50, 55, 50);
  line (80, 55, 55, 50); 
  strokeWeight(8);
  noFill();
  stroke(#F2720F);
  arc(75, 52, 30, 60, radians(-30), radians(90));
  popMatrix();

  noStroke();
  fill(#C6FAFF, 60);
  rect(487, 87, 110, 87); //glass
  rect(487, 187, 110, 87);
}


void drawGround() {
  for (int x=-10; x< width; x+=random(2, 5)) {
    for (int y=470; y< height; y++) {
      fill(random(20, 50), random(80, 200), random(0, 30));
      pushMatrix();
      translate(x, y);
      rotate(radians(30));
      rect(0, 0, 5, 20);
      popMatrix();
    }
  }
  fill(#481F11);
  quad(185, 490, 420, 490, 440, 550, 165, 550);
}


void drawParents() {

  //  mouseX > 185 & mouseX < 420 & mouseY > 90 & mouseY <46
  pushMatrix();
  translate(190, 90);
  //woman 
  fill(#5F1B10);
  ellipse(175, 65, 100, 100); // hair
  rect(125, 65, 100, 70, 0, 0, 40, 40);
  fill(#460F06);
  rect(135, 75, 80, 60, 0, 0, 40, 40);
  fill(#F5C18D);
  rect(165, 80, 20, 50);//neck
  fill(#715031, 60);
  rect(165, 80, 20, 45, 10);//neck shadow
  fill(#F5C18D);
  ellipse(175, 70, 80, 90); //Whead
  quad(137, 150, 155, 150, 150, 210, 142, 210); //right arm
  quad(215, 150, 200, 150, 202, 210, 210, 210); //left arm 
  fill(0);
  arc(175, 55, 80, 60, radians(180), radians(360)); // hairband
  fill(#5F1B10);
  arc(175, 55, 80, 40, radians(180), radians(360)); // bangs 
  fill(#D67080, 120);
  ellipse(150, 83, 20, 20); //cheek
  ellipse(200, 83, 20, 20); //cheek
  ellipse(175, 75, 5, 12); //nose
  stroke(#270D04);
  noFill();
  strokeWeight(3);
  arc(153, 70, 20, 15, radians(195), radians(347)); //left eye
  arc(197, 70, 20, 15, radians(195), radians(347)); //right eye
  noStroke();
  fill(#CE212D);
  arc(175, 90, 17, 11, 0, PI); //bottom lip
  stroke(#670F26);
  noFill();
  strokeWeight(1);
  arc(173, 87, 25, 7, radians(0), radians(150)); //mouth curve 
  noStroke();
  fill(#670F26);
  arc(175, 90, 15, 7, radians(180), radians(360)); //top lip 
  noStroke();
  pushMatrix();
  translate(133, 70);
  rotate(20);
  fill(#F5C18D);
  ellipse(0, 0, 20, 10);
  popMatrix();
  pushMatrix();
  translate(133+83, 70);
  rotate(-20);
  fill(#F5C18D);
  ellipse(0, 0, 20, 10);
  popMatrix();
  fill(#810C14);
  quad(150, 130, 200, 130, 190, 200, 160, 200);//chest
  ellipse(145, 140, 20, 30); //Left sleeve
  ellipse(205, 140, 20, 30); //rightSleeve 
  ellipse(175, 230, 70, 70); //hips
  quad(210, 230, 140, 230, 130, 300, 220, 300); //skirt
  fill(255);
  rect(135, 145, 20, 10, 0, 0, 10, 10); //left sleeve white 
  rect(195, 145, 20, 10, 0, 0, 10, 10); //left sleeve white 
  fill(#550308, 100);
  ellipse(175, 155, 50, 40); //underboobs
  fill(#810C14);
  ellipse(175, 150, 60, 40); //boobs
  fill(255);
  triangle(160, 130, 175, 130, 170, 140); //collar
  triangle(175, 130, 190, 130, 180, 140); //collar
  fill(#5A1109);
  quad(155, 195, 197, 190, 197, 200, 155, 200);//belt
  fill(0);
  quad(155, 300, 175, 300, 170, 360, 160, 360); //right leg
  quad(175, 300, 195, 300, 190, 360, 180, 360); //left leg 
  fill(#E8BF17);
  rect(158, 360, 14, 10, 10, 10, 0, 0); //left shoe
  rect(178, 360, 14, 10, 10, 10, 0, 0); //right shoe
  //man 
  fill(#240703);
  ellipse(75, 50, 90, 90); //hair
  fill(255);
  quad(45, 115, 105, 115, 95, 200, 55, 200);//chest
  quad(37, 115, 55, 115, 52, 230, 42, 230); //right arm
  quad(113, 115, 98, 115, 98, 230, 108, 230); //left arm 
  fill(#810C14);
  triangle(65, 125, 85, 125, 75, 140); //tie knot
  triangle(65, 175, 85, 175, 75, 190); //tie point
  triangle(75, 120, 65, 175, 85, 175); //tie body 
  fill(255);
  stroke(#989190);
  quad(50, 115, 65, 115, 75, 125, 65, 130); //collar
  quad(85, 115, 100, 115, 85, 130, 75, 125); //collar 
  noStroke();
  fill(0);
  quad(55, 210, 75, 210, 74, 360, 58, 360); //right leg
  quad(75, 210, 95, 210, 90, 360, 76, 360); //left leg 
  fill(#4D120B);
  rect(50, 200, 50, 10); //belt 
  rect(55, 358, 20, 12, 10, 10, 0, 0); //left shoe
  rect(75, 358, 20, 12, 10, 10, 0, 0); //right shoe
  stroke(#E8BF17);
  strokeWeight(3);
  noFill();
  rect(70, 200, 10, 10);
  noStroke();
  fill(#A06741);
  rect(65, 80, 20, 35);//neck
  triangle(65, 115, 85, 115, 75, 125);
  fill(#64322B, 100);
  rect(65, 80, 20, 30, 10);//neck shadow
  fill(#A06741);
  ellipse(75, 60, 80, 80);//Mhead
  fill(#240703);
  rect(42, 20, 65, 15); //bangs 
  arc(75, 80, 45, 25, radians(180), radians(360)); // moustache
  stroke(#270D04);
  noFill();
  strokeWeight(3);
  arc(53, 55, 20, 15, radians(195), radians(347)); //left eye
  arc(97, 55, 20, 15, radians(195), radians(347)); //right eye
  noStroke();
  fill(#64322B, 100);
  ellipse(75, 57, 7, 15); //nose

  popMatrix();
}

void drawBabyBag(int x, int y) {
  pushMatrix();
  translate(BabyBagX+x, y);
  scale(.9);
  translate(-162, -138);
  fill(#fef9dc);
  triangle(161, 55, 158, 40, 176, 45);
  triangle(131, 110, 162, 60, 193, 110);
  ellipse(162, 138, 80, 90);
  popMatrix();
}
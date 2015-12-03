float catx, catvx, caty, catvy;

void setup() {
  size(600, 600);
  catx=250;
  caty=600;
  catvy=-4;
  catvx=-.5;
}

void draw() {
  background(#043152);
  drawWomenHead();
  drawManHead();
  catx=catx+catvx;
  caty=caty+catvy;
  if (caty<=400) {
    catvy=catvy*-1;
    catvx=-1;
  }
  drawCat(catx, caty);
}


void drawWomenHead() {
  pushMatrix();
  translate(450, 270);
  scale(2);
  translate(-175, -90);
  noStroke();
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
  ellipse(146, 220, 15, 25);//hands 
  ellipse(206, 220, 15, 25);
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
  strokeWeight(2);
  arc(153, 55, 21, 18, radians(200), radians(350)); //left eyebrow
  arc(197, 55, 21, 18, radians(200), radians(350)); //right eyebrow
  stroke(#270D04);
  fill(255);
  strokeWeight(2);
  arc(153, 65, 17, 17, radians(180), radians(360)); //left eye
  arc(197, 65, 17, 17, radians(180), radians(360)); //right eye
  noStroke();
  fill(255);
  ellipse(153, 65, 16, 16); //left eye
  ellipse(197, 65, 16, 16); //right eye
  fill(#1F810C);
  arc(153, 65, 13, 13, radians(0), radians(360)); //left pupil
  arc(197, 65, 13, 13, radians(0), radians(360)); //right pupil
  fill(0);
  arc(153, 65, 7, 7, radians(0), radians(360)); //left pupil
  arc(197, 65, 7, 7, radians(0), radians(360)); //right pupil
  stroke(#CE212D);
  fill(#DB82A9);
  arc(175, 95, 12, 13, 0, PI); //bottom lip
  stroke(#670F26);
  arc(175, 95, 13, 13, radians(180), radians(360)); //top lip 
  stroke(#AF396C);
  strokeWeight(1);
  arc(175, 95, 11, 11, radians(180), radians(360)); //roof of mouth 
  noStroke();
  fill(255);
  arc(175, 93, 11, 8, radians(180), radians(360)); //teeth
  fill(#AF396C);
  ellipse(175, 99, 7.5, 4);//tongue
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
  popMatrix();
}


void drawManHead() {
  pushMatrix();
  translate(150, 200);
  scale(2);
  translate(-75, -80);
  fill(#A06741);
  ellipse(48, 235, 15, 25);//hands 
  ellipse(103, 235, 15, 25);
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
  fill(#240703);
  noStroke();
  ellipse(75, 50, 90, 90); //hair
  fill(#A06741);
  rect(65, 80, 20, 35);//neck
  triangle(65, 115, 85, 115, 75, 125);
  fill(#64322B, 100);
  rect(65, 80, 20, 30, 10);//neck shadow
  fill(#A06741);
  ellipse(75, 60, 80, 80);//Mhead
  strokeWeight(3);
  stroke(#6C1F21);
  fill(#CB73A2);
  ellipse(75, 80, 10, 10);
  noStroke();
  fill(#240703);
  rect(42, 20, 65, 15); //bangs 
  arc(75, 80, 45, 25, radians(180), radians(360)); // moustache
  stroke(#270D04);
  noFill();
  strokeWeight(2);
  arc(53, 45, 21, 18, radians(200), radians(350)); //left eyebrow
  arc(97, 45, 21, 18, radians(200), radians(350)); //right eyebrow
  strokeWeight(3);
  fill(255);
  arc(53, 55, 20, 20, radians(180), radians(360)); //left eye
  arc(97, 55, 20, 20, radians(180), radians(360)); //right eye
  noStroke();
  fill(255);
  ellipse(53, 55, 19, 19); //left eye
  ellipse(97, 55, 19, 19); //right eye
  fill(#481D17);
  arc(53, 55, 16, 16, radians(0), radians(360)); //left pupil
  arc(97, 55, 16, 16, radians(0), radians(360)); //right pupil
  fill(0);
  arc(53, 55, 10, 10, radians(0), radians(360)); //left pupil
  arc(97, 55, 10, 10, radians(0), radians(360)); //right pupil
  noStroke();
  fill(#64322B, 100);
  ellipse(75, 57, 7, 15); //nose
  popMatrix();
}

void drawCat(float x, float y) {
  pushMatrix();
  translate(x, y);
  scale(1.5);
  translate(-50, -70);
  noStroke();
  strokeWeight(5);
  stroke(#838383);
  noFill();
  arc(105, 62, 30, 20, radians(180), radians(360));
  noStroke();
  fill(#838383);
  beginShape(); //head
  vertex(30, 20);
  vertex(70, 20);
  vertex(70, 65);
  vertex(45, 65);
  vertex(30, 50);
  endShape();
  rect(69, 30, 22, 36);//body
  rect(89, 30, 32, 25);
  rect(119, 30, 22, 36);
  quad(70, 65, 92, 65, 84, 100, 78, 100);//left leg
  quad(118, 65, 140, 65, 121, 100, 115, 100); //right leg
  ellipse(76, 97, 12, 6);//paws
  ellipse(113, 97, 12, 6);
  beginShape(); //tail
  vertex(140, 65);
  vertex(140, 10);
  vertex(148, 20);
  vertex(150, -10);
  vertex(158, 0);
  vertex(164, -30);
  vertex(168, 0);
  vertex(180, -10);
  vertex(165, 25);
  vertex(180, 20);
  // vertex(30,
  endShape();
  ellipse(105, 30, 70, 30);
  triangle(30, 20, 40, 20, 30, 5); //ears
  triangle(60, 20, 70, 20, 70, 5);
  fill(255);
  ellipse(43, 40, 10, 10);//eyes
  ellipse(57, 40, 15, 15);
  fill(0);
  ellipse(43, 40, random(2, 4), random(2, 4));//pupils
  ellipse(57, 40, random(6, 8), random(6, 8));
  fill(#FA5DD8);
  triangle(45, 50, 55, 50, 50, 56);//nose
  stroke(0);
  strokeWeight(2);
  line (20, 45, 45, 50);//whiskers
  line (20, 50, 45, 50);
  line (20, 55, 45, 50);
  line (80, 45, 55, 50);
  line (80, 50, 55, 50);
  line (80, 55, 55, 50); 
  popMatrix();
}
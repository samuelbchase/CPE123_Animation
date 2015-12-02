
void drawScaredParents() {
  fill(#043152);
  rect(0,0,600,600);
  drawWomenHead();
  drawManHead();
}


void drawWomenHead() {
  pushMatrix();
  translate(450, 270);
  scale(3.4);
  translate(-175, -70);
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
  fill(255);
  rect(135, 145, 20, 10, 0, 0, 10, 10); //left sleeve white 
  rect(195, 145, 20, 10, 0, 0, 10, 10); //left sleeve white 
  fill(#550308, 100);
  ellipse(175, 155, 50, 40); //underboobs
  fill(#810C14);
  ellipse(175, 150, 60, 40); //boobs
  popMatrix();
}


void drawManHead() {
  pushMatrix();
  translate(150, 200);
  scale(3.4);
  translate(-75, -60);
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
  fill(#240703);
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
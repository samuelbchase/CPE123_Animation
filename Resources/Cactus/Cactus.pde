int thorns=60;

float ptx[] = new float[thorns];
float pty[] = new float[thorns];
float thornRot[] = new float[thorns];

void setup(){
  size(600,600);
  background(0);
    for (int i=0; i<thorns; i++) {
    ptx[i]= random(135, 315);
    pty[i]= random(160, 440);
    thornRot[i] = random(radians(0), radians (360));
  }
}
 
 
 void draw() {
   drawMaracas();
 }
 
 void drawMaracas() {
  drawCactus();
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
 
 void drawCactus(){
 noStroke();
  fill(#D1A639); //sombrero brown
  ellipse(225, 200, 300, 100);
  rect(75, 140, 300, 60);
  fill(#4DF01D); // cactus green 
  rect(125, 150, 200, 300, 90, 90, 10, 10);
  rect(60, 280, 50, 80, 90, 90, 10, 10);
  rect(60, 330, 100, 50, 90);
  rect(340, 280, 50, 80, 90, 90, 10, 10);
  rect(290, 330, 100, 50, 90);
  for (int i=0; i<thorns; i++) {
    noStroke();
    pushMatrix();
    translate(ptx[i], pty[i]);
    rotate(thornRot[i]);
    fill(#0E6717, 200);
    triangle(0, 0, 3, 12, -3, 12);
    popMatrix();
  }
  fill(#D1A639); //sombrero brown
  ellipse(225, 170, 250, 60);
  rect(185, 50, 80, 100, 200, 200, 0, 0);
  quad(185, 80, 265, 80, 290, 140, 160, 140);
  stroke(#83620D);//dark brown sombrero
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
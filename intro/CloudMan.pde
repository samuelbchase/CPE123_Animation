void drawCloudMan() {
  pushMatrix();
  translate(cloudmanx, cloudmany);
  scale(cloudmanSize);
  translate(-390, -137);

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


  pushMatrix();
  translate(490, 255);
  rotate(rightCloudArm);
  translate(-490, -255);
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
  ellipse(485, 250, 70, 90); //right arm
  ellipse(515, 220, 60, 80); //right arm
  fill(lightC);
  ellipse(480, 245, 70, 90); //right arm
  ellipse(510, 215, 60, 80); //right arm 
  popMatrix();
  
  fill(darkC);
  ellipse(390, 140, 100, 80);
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

  popMatrix();
}
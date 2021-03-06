void gator(float gatorHeadR) {
  pushMatrix();
  ///*
  translate(300, 490);
   scale(.3);
   translate(-300, -200);
  // */
  //spikes on back
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
  //body
  fill (123, 185, 106);
  ellipse(344, 206, 233, 186);
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
  beginShape();
  vertex(302, 122);
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
  vertex(146, 250);
  endShape(CLOSE);
  //neck
  ellipse(209, 184, 210, 184);
  //make head move
  pushMatrix();
  translate(181, 163);
  rotate(gatorHeadR);
  translate(-181, -163);
  //head
  ellipse(70, 155, 74, 69);
  ellipse(159, 86, 68, 119);
  ellipse(207, 94, 82, 139);
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
  vertex(302, 122);
  vertex(157, 252);
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
  noStroke();
  //teeth
  fill(255);
  triangle(82, 195, 93, 203, 98, 192);
  triangle(157, 194, 167, 182, 173, 198);
  triangle(208, 186, 221, 190, 214, 175);
  popMatrix();
  
  //end of head translation
  noFill();
  stroke(#517A46);
  strokeWeight(2);
  //throat
  arc(204, 215, 180, 120, 2*PI/8, 6*PI/8);
  //feet lines
  arc(190, 320, 130, 80, 11*PI/8, 14*PI/8);
  arc(310, 328, 130, 80, 10*PI/8, 13*PI/8);
  arc(313, 300, 130, 100, radians(300), radians(380));
  arc(413, 240, 130, 100, radians(-20), radians(90));
  arc(270, 239, 180, 100, radians(90), radians(130));
  popMatrix();
}
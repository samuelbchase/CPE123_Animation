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

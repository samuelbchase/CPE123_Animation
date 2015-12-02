void drawSky() {
  skycount++;

  background(40-(skycount*.05), 220-(skycount*.2), 245-(skycount*.2));

  if (skycount==1225){
    skycount=1;
    cloudO=1;
  }
  
  if (skycount >=600 & skycount <=1225) {
    for (int h=0; h<stars; h++) {
      fill(255, 255, random(140, 255),random(50,200));
      ellipse(starx[h], stary[h], 3, 3);
    }
  }

  cloudT=600-cloudO;
  cloudO++;

  for (int i=0; i<clouds; i++) {
    drawCloud(cloudx[i], cloudy[i], cloudSize[i]);
  }
}

void drawCloud(float x, float y, float size) {
  pushMatrix();
  translate (x, y);
  scale(size);
  translate(-200, -250);
  noStroke();
  fill(255, cloudT);
  ellipse(200, 180, 200, 100);
  fill(150, cloudT);
  ellipse(200, 210, 80, 80);
  fill(255, cloudT);
  ellipse(200, 207, 77, 77);
  fill(150, cloudT);
  ellipse(262, 202, 100, 100);
  fill(255, cloudT );
  ellipse(260, 198, 97, 97);
  fill(150, cloudT);
  ellipse(261, 160, 68, 68);
  ellipse(77, 173, 120, 80);
  ellipse(140, 200, 85, 90);
  fill(255, cloudT);
  ellipse(258, 159, 70, 70);
  ellipse(228, 132, 50, 50);
  ellipse(100, 130, 95, 95);
  ellipse(160, 130, 100, 60);
  ellipse(82, 171, 118, 79);
  ellipse(142, 196, 85, 90);
  fill(150, cloudT);
  ellipse(65, 210, 100, 70);
  fill(255, cloudT);
  ellipse(65, 206, 100, 70);
  fill(150, cloudT);
  ellipse(17, 190, 50, 50);
  fill(255, cloudT);
  ellipse(19, 187, 50, 50);
  popMatrix();
}
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
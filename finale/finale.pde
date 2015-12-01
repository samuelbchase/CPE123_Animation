float dx=420;
float dy=90;
float dy2=460;
float dwx=400;
float dw=30;
float dvw=.6;
float dvx=15;
float dvxw=14.2;
float dvy=2;
int end = 1;
int secondaryCounter = 1;
int i = 0;
float craneX, craneY, craneR, craneHeadR, wingScale, craneLegR, craneNeckR, bagX, bagY;
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
  if (i<10) {
    //crane standing
    craneX = 210;
    craneY = 420;
    craneR = radians(280);
    craneHeadR  = radians(-10);
    craneNeckR = 0;
    bagX = craneX+55;
    bagY = craneY-8;
    craneLegR = radians(290);
  } else if (i<18) {
  //crane sets down bag
    craneNeckR = (radians(i-10))*4;
    craneHeadR = (radians(-10)- (radians(i-10))*4);
    bagX = craneX+42+76*(cos(radians(280)+ 4*(radians(i-10))));//should be 300, 490 at end
    bagY = craneY+67+76*(sin(radians(280)+ 4*(radians(i-10))));
  } else if (i<25) {
    //crane lifts head back up
    craneNeckR = (radians(i-25))*-4;
    craneHeadR = (radians(-10)- (radians(i-25))*-4);
    bagX = 300;//should be ~300, 490 at end
    bagY = 428.8+9.8*(i-18);
  } else if (i<35) {
    //crane rotates from standing to flying position
   /* if (i % 2 == 0) {
      wingScale = 50;
    } else {
      wingScale = 170;
    }*/
    craneX = 210;
    craneY = 420;
    craneR = radians(280)+ 4*(radians(i-25));
    craneHeadR  = radians(-10)- 4*(radians(i-25)); 
    
  } else if (i<133) {
    //crane flying
     if (i % 2 == 0) {
      wingScale = 50;
    } else {
      wingScale = 170;
    }
    craneX = 210+(i-33)*10;
    craneY = 420-(i-33)*6;
    craneHeadR  = radians(-84)+cos(radians(i))*.1;
    craneLegR =0;
  }
  i++;
  println(i);
  drawBabyBag(bagX, bagY);
  crane(craneX, craneY, craneR, craneHeadR, wingScale, craneLegR, craneNeckR);
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
    craneX = -1000;
    craneY= -1000;
  }
  if (clickBabyBag == true) {
    gator();
    bagX=5000;
    bagY=5000;
  }
  if (dx <= 210) {
    dvx=0;
    dvy=0;
    dvxw=0;
    dvw=0;
  }
}


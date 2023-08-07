//Charlotte Jacques
//Block 1-2 B
//Sep 22 2020
//video code source: https://www.processing.org/reference/libraries/video/Movie.html
//video link: https://www.videvo.net/video/flying-over-small-icebergs/452785/

//SOMETHING I CARE ABOUT

//video imports + variables
import processing.video.*;
Movie myMovie;

//other variables
int counter;
float degrees, rotateSpeed;
PFont fragmentCore, keepCalm, paperFlowers;

void setup() {//=========================================================================
  size(800, 600, P2D);

  myMovie = new Movie(this, "icebergs melting.mov");

  counter = 0;
  degrees = -10;
  rotateSpeed = 0.3;
  fragmentCore = createFont("Fragmentcore.otf", 100);
  keepCalm = createFont("KeepCalm-Medium.ttf", 15);
  paperFlowers = createFont("Paper Flowers.ttf", 100);
}

void draw() {//==========================================================================
  counter = counter + 1;

  if (counter < 120) {//START-------------------------------------------------------------
    background(0);
    textAlign(CENTER, CENTER);
    textFont(fragmentCore);
    text("something I", 400, 250);
    text("care about", 400, 350);
  } else if (counter > 120 && counter < 420) {//VIDEO-------------------------------------
    background(232, 232, 232);
    noStroke();

    //TV
    fill(0);
    rect(190, 180, 420, 240);
    rect(385, 420, 30, 50);
    triangle(400, 450, 330, 490, 470, 490);

    //table
    fill(162, 129, 129);
    rect(150, 490, 500, 120, 10);//main table
    stroke(72, 47, 54);
    rect(160, 520, 235, 60);//left drawer
    rect(405, 520, 235, 60);//right drawer
    noStroke();
    fill(72, 47, 54);
    ellipse(277.5, 550, 15, 15);//left knob
    ellipse(522.5, 550, 15, 15);//right knob

    //video
    myMovie.play();
    image(myMovie, 208, 192, 384, 216);

    //video text
    fill(35, 35, 35);
    rect(230, 360, 340, 40);//background
    fill(255);
    textAlign(CENTER, CENTER);
    textFont(keepCalm);
    text("In the Arctic and Antarctic, icebergs are", 400, 370);
    text("rapidly melting due to climate change.", 400, 390);
  } else if (counter > 420 && counter < 450) {//BREAK------------------------------------
    background(0);
  } else if (counter > 450) {//PROTEST---------------------------------------------------
    noStroke();
    background(176, 205, 227);

    //ground
    fill(151, 157, 162);
    rect(0, 400, 800, 200);

    //legs
    fill(20, 46, 100);
    ellipse(400, 475, 200, 600);
    fill(151, 157, 162);
    triangle(380, 600, 420, 600, 400, 470);

    //arms
    stroke(240, 223, 179);
    strokeWeight(40);
    line(522.5, 250, 535, 370);//right arm
    line(277.5, 250, 266, 310);//half left arm

    //t-shirt
    noStroke();
    fill(118, 162, 140);
    quad(295, 370, 505, 370, 495, 190, 305, 190); 
    rect(305, 170, 190, 50, 70); 
    ellipse(490, 205, 80, 70);//right shoulder
    quad(530, 205, 545, 250, 500, 260, 500, 200);//right sleeve
    ellipse(310, 205, 80, 70);//left shoulder
    quad(270, 205, 255, 250, 300, 260, 300, 200);//left sleeve

    //neck
    fill(240, 223, 179);
    ellipse(400, 170, 100, 70);//shirt neckline
    fill(165, 152, 30);
    ellipse(440, 145, 30, 50);
    ellipse(360, 145, 30, 50);
    fill(240, 223, 179);
    rect(375, 120, 50, 50);//neck

    //head
    ellipse(400, 90, 100, 130);

    //hair
    fill(165, 152, 30);
    rect(340, 40, 30, 160, 100);//left hair
    rect(430, 40, 30, 160, 100);//right hair
    ellipse(400, 50, 120, 50);//top hair
    fill(240, 223, 179);
    ellipse(400, 75, 60, 40);

    //face
    fill(255);
    ellipse(385, 90, 20, 10);//left eye
    ellipse(415, 90, 20, 10);//right eye
    fill(65, 85, 65);
    ellipse(385, 90, 10, 10);//left eyeball
    ellipse(415, 90, 10, 10);//right eyeball
    fill(180, 127, 142);
    ellipse(400, 130, 25, 10);//mouth
    stroke(0);
    strokeWeight(2);
    line(400, 105, 405, 112);//nose
    line(405, 112, 400, 112);//nose

    //sign
    sign();
    degrees = degrees + rotateSpeed;
    if (degrees > 10) {
      rotateSpeed = -0.3;
    } else if (degrees < -10) {
      rotateSpeed = 0.3;
    }
  }
}

void movieEvent(Movie m) {//=============================================================
  m.read();
}

void sign() {//==========================================================================
  pushMatrix();
  translate(266, 310);
  rotate(radians(degrees));

  //arm
  stroke(240, 223, 179);
  strokeWeight(40);
  line(0, 0, -60, -60);

  //stick
  stroke(77, 73, 32);
  strokeWeight(10);
  line(-70, -65, -85, -120);

  //sign
  noStroke();
  fill(255);
  rect(-200, -300, 230, 180); 

  //text
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(100);
  textFont(paperFlowers);
  text("CLIMATE", -85, -265);
  text("ACTION!", -85, -175);

  popMatrix();
}

//Sophia Carlone

float timer1 = 0;
float timer2 = 0;
float delay1 = 1000/1f; // 1 fps
float delay2 = 1000/.7f;

ParticleSystem ps;
ArrayList<Cloud> clouds;
ArrayList<Fish> fish;

color babyBlue = color(102, 160, 240);

float beginx = random(0, 801);
float beginy = 600;
float endx = random(beginx-20, beginx+20);
float endy = random(beginy-20, beginy);
float upperbound = random(0, 400);
float seeweed = random(1, 8);

PGraphics pg;
int seeweed_count = 0;

//set up stage
void setup() {
  size(800, 600, P3D); //background size
  //background(0, 10);
  //setGradientV(0, 0, 800, 600, #000000, #5C266C); //background
  frameRate(30); //will be taken out later
  ps = new ParticleSystem();
  //noStroke();
  clouds = new ArrayList<Cloud>();
  fish = new ArrayList<Fish>();
  //blendMode(MULTIPLY);
  pg = createGraphics(800, 600);
  pg.beginDraw();
  while(seeweed_count < seeweed){
    color c = color(50, random(175, 255), 80);
    if(endy > upperbound){
      pg.stroke(c);
      //stroke(#1C672A);
      pg.fill(c, 200);
      pg.curve(random(800), random(600), beginx, beginy, endx, endy, random(800), random(600));
      beginx = endx;
      beginy = endy;
      endx = random(endx-20, endx+20);
      endy = random(endy-20, endy);
    }
    else{
      seeweed_count++;
      beginx = random(0, 801);
      beginy = 600;
      endx = random(beginx-20, beginx+20);
      endy = random(beginy-20, beginy);
      upperbound = random(0, 400);
    }
  }
  pg.endDraw();
}

void draw(){
  background(babyBlue, 10); //just dots
  ps.addParticle();
  ps.addParticle();
  ps.addParticle();
  ps.addParticle();
  ps.run();
  
  if( millis() > timer2 ){
    fish.add(new Fish());
    timer2+=delay2;
  }
  

  for(int i = fish.size()-1; i >= 0; i--){
    Fish f = fish.get(i);
    f.run();
  }

 image(pg, 0, 0);
}


//GARBAGE COLLECTION:

void setGradientH(int x, int y, float w, float h, color c1, color c2) {
  noFill();
  for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
}

void setGradientV(int x, int y, float w, float h, color c1, color c2) {
  noFill();
  for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
}

void runCloud() {
  for (int i = clouds.size()-1; i >= 0; i--) {
    Cloud p = clouds.get(i);
    p.run();
    if (p.isDead()) {
      clouds.remove(i);
    }
  }
}  
//clouds.add(new Cloud(255));

//runCloud();
  
//  for (int i = clouds.size()-1; i >= 0; i--) {
//    Cloud p = clouds.get(i);
//    p.run();
//    if (p.isDead()) {
//      clouds.remove(i);
//    }
//  }

//if( millis() > timer2 ){
//  //clouds.add(new Cloud(255));
//  runCloud();    
//  timer2+=delay2;
//}

//void fish(){
//  noStroke();
//  fill(#F0A313);
  
//  ellipse(BEGINX_e, BEGINY_e, 80, 50);
//  translate(0, 0, random(-10, 10)); //really funny
//  triangle(BEGINX1_t, BEGINY1_t, BEGINX2_t, BEGINY2_t, BEGINX3_t, BEGINY3_t);
//  translate(0, 0, random(-10, 10)); //really funny
  
//  //fill(255);
//  //ellipse(BEGINX_e, BEGINY_e, 80, 50);
//  //translate(0, 0, random(-10, 10)); //really funny
//  //triangle(BEGINX1_t, BEGINY1_t, BEGINX2_t, BEGINY2_t, BEGINX3_t, BEGINY3_t);
//  //translate(0, 0, random(-10, 10)); //really funny
  
//  BEGINX_e -= step;
//  //BEGINY_e += step;
//  BEGINX1_t -= step;
//  BEGINX2_t -= step;
//  BEGINX3_t -= step;
//}


/* vines
float beginx = random(0, 801);
float beginy = 600;
float endx = random(beginx-20, beginx+20);
float endy = random(beginy-20, beginy);
float upperbound = random(0, 200);

void setup(){
  size(800, 600);
  background(0);
  frameRate(10);
}

void draw(){
  //background(0);
  if(endy > upperbound){
    stroke(#1C672A);
    fill(#1C672A);
    curve(random(800), random(600), beginx, beginy, endx, endy, random(800), random(600));
    beginx = endx;
    beginy = endy;
    endx = random(endx-20, endx+20);
    endy = random(endy-20, endy);
  }
}

*/

///constants
//float BEGINX = 0.0;  // Initial x-coordinate
//float ENDX = 850;   // Final x-coordinate

//float beginY;
//float CbeginY;
//float endY;
//float CendY;
//float distX;          // X-axis distance to move
//float distY;          // Y-axis distance to move
//float exponent = random(2);   // Determines the curve
//float x = 0.0;        // Current x-coordinate
//float y = 0.0;        // Current y-coordinate
//float step = 0.01;    // Size of each step along the path
//float pct = 0.0;      // Percentage traveled (0.0 to 1.0)


//void makeClouds(){
//  CendY = random(601);   // Final y-coordinate
//  CbeginY = random(601);  // Initial y-coordinate
//  distX = ENDX - BEGINX;
//  distY = endY - beginY;
  
//  fill(0, 2);
//  rect(0, 0, width, height);
  
//  pct += step;
//  if (pct < 1.0) {
//    x = BEGINX + (pct * distX);
//    y = beginY + (pow(pct, exponent) * distY);
//  }
  
//  stroke(babyBlue);
//  fill(babyBlue);
//  ellipse(x, y, 50, 50);  
//}

//color babyBlue = color(102, 160, 240);
//color white = color(240, 246, 255);
//color darkBlue = color(40, 45, 85); 
//color gray = color(83, 80, 95);

  //int radius = 100;
  //circle(cos(s) * radius, cy + sin(s) * radius, 25);
  //line(cx, cy, cx + cos(s) * radius, cy + sin(s) * radius);
  //s++;
  
  //color babyBlue = color(102, 160, 240);
  //color white = color(240, 246, 255);
  //color darkBlue = color(40, 45, 85); 
  //color gray = color(83, 80, 95);
  //color[] colors = {babyBlue, white, darkBlue, gray};
  
  //float timer1 = 0;
  //float timer2 = 0;
  //float delay1 = 1000/1f; // 1 fps
  //float delay2 = 1000/5f; // 5 fps
  
  //int firstAnchorx = int(random(401));
  //int firstAnchory = int(random(301));
  //int lastAnchorx = int(random(401));
  //int lastAnchory = int(random(301));
  //int x1 = int(random(401));
  //int y1 = int(random(301));
  //int x2 = int(random(401));
  //int y2 = int(random(301));
  
  //if( millis() > timer1 ){
  //  noFill();
  //  strokeWeight(100);
  //  stroke(babyBlue);
  //  bezier(firstAnchorx, firstAnchory, x1, y1, x2, y2, lastAnchorx, lastAnchory);
  //  timer1+=delay1;

  //if( millis() > timer2 ){
  //  firstAnchorx = int(random(401));
  //  firstAnchory = int(random(301));
  //  lastAnchorx = int(random(401));
  //  lastAnchory = int(random(301));
  //  x1 = int(random(401));
  //  y1 = int(random(301));
  //  x2 = int(random(401));
  //  y2 = int(random(301));
    
  //  noFill();
  //  strokeWeight(int(random(5, 20)));
  //  stroke(240, 246, 255, 50);
  //  bezier(firstAnchorx, firstAnchory, x1, y1, x2, y2, lastAnchorx, lastAnchory);
  //  timer2+=delay2;
  //}

//}
  
  //scale(0.5);
  //strokeWeight(20);
  //stroke(white);
  //translate(0, 0, -50);
  //bezier(firstAnchorx, firstAnchory, x1, y1, x2, y2, lastAnchorx, lastAnchory);
  
  //int randAdjust = int(random(-20, 20));
  //noFill();
  //strokeWeight(23);
  //stroke(white);
  //bezier(firstAnchorx+randAdjust, firstAnchory+randAdjust, int(random(x1, x2)), 
  //  int(random(y1,y2)), int(random(x1,x2)), int(random(y1,y2)), lastAnchorx+randAdjust, lastAnchory+randAdjust);

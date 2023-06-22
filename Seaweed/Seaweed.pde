float beginx = random(0, 801);
float beginy = 600;
float endx = random(beginx-20, beginx+20);
float endy = random(beginy-20, beginy);
float upperbound = random(0, 400);
float seeweed = random(1, 8);
//float seeweed_count = 0;
//float b = 80;
//float gLB = 175;
PGraphics pg;
int start = 0;
int seeweed_count = 0;

void setup(){
  size(800, 600);
  background(0);
  frameRate(15);
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
      //b += 10;
      //gLB += 10;
      beginx = random(0, 801);
      beginy = 600;
      endx = random(beginx-20, beginx+20);
      endy = random(beginy-20, beginy);
      upperbound = random(0, 400);
      //seeweed++;
    }
  }
  pg.endDraw();
}

void draw(){
  //if(start == 0){
  //  pg.beginDraw();
  //  start++;
  //}
  ////background(0);
  //if(seeweed_count < seeweed){
  //  color c = color(50, random(175, 255), 80);
  //  if(endy > upperbound){
  //    pg.stroke(c);
  //    //stroke(#1C672A);
  //    pg.fill(c, 200);
  //    pg.curve(random(800), random(600), beginx, beginy, endx, endy, random(800), random(600));
  //    beginx = endx;
  //    beginy = endy;
  //    endx = random(endx-20, endx+20);
  //    endy = random(endy-20, endy);
  //  }
  //  else{
  //    seeweed_count++;
  //    //b += 10;
  //    //gLB += 10;
  //    beginx = random(0, 801);
  //    beginy = 600;
  //    endx = random(beginx-20, beginx+20);
  //    endy = random(beginy-20, beginy);
  //    upperbound = random(0, 400);
  //    //seeweed++;
  //  }
  //}
  //else{
  //  pg.endDraw();
  //  image(pg, 0, 0);
  //}
  image(pg, 0, 0);
}

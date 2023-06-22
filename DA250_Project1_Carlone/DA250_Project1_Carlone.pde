//Sophia Carlone

  color babyBlue = color(102, 160, 240);
  color white = color(240, 246, 255);
  color darkBlue = color(40, 45, 85); 
  color gray = color(83, 80, 95);
  color[] colors = {babyBlue, white, darkBlue, gray};

int leftX = 150;


float y =  random(601);
float x = random(200, 600);

float step = 10;

float deltaX = random(10,25);
float deltaY = random(-25,25);

//set up stage
void setup() {
  size(800, 600); //background size
  //background(0); //testing purposes
  frameRate(2);
  


}

void draw(){
  
  noStroke();
  beginShape();
  ellipse(x, y, 50, 50);
  fill(255, 255, 255, random(100, 255));
  ellipse(x+deltaX+step, y-deltaY, 50, 50); 
  fill(255, 255, 255, random(100, 255));
  ellipse(x-deltaX+step, y-deltaY, 50, 50);
  fill(255, 255, 255, random(100, 255));
  endShape();
  scale(random(5));
  x = x + step;
  
  //  //left cloud
  //noStroke();
  //ellipse(leftX, 150, 126, 97);
  //ellipse(leftX+62, 150, 70, 60);
  //ellipse(leftX-62, 150, 70, 60);
  //  //leftX=leftX-1;
  
  
  //int x = int(random(2));
  //if(x == 1)setGradientH(0, 0, width, height, babyBlue, white);
  //else setGradientH(0, 0, width, height, darkBlue, gray); 
  //sleep(); 
  //blendMode(ADD);
  //int randx = int(random(801));
  //int randy = int(random(601));
  //int randx2 = int(random(randx, 801));
  //int randy2 = int(random(randy, 601));
  //setGradientH(randx, randy, randx2, randy2, darkBlue, gray);
  ////blendMode(MULTIPLY);
  //randx = int(random(801));
  //randy = int(random(601));
  //randx2 = int(random(randx, 801));
  //randy2 = int(random(randy, 601));
  //setGradientH(randx, randy, randx2, randy2, babyBlue, white);
  ////setGradient(0, 0, 800, 600, colors, 4);
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

void setGradientH(int x, int y, float w, float h, color c1, color c2) {

  noFill();
  for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
}

void setGradient(int x, int y, float w, float h, color cl[], int size) {
  int colorSpread = int((h-y)/size);
  color c1, c2;
  int count = 0;
  noFill();
  for (int i = y; i <= y+h; i++) {
    c1 = cl[count];
    c2 = cl[count+1];
    float inter = map(i, y, y+h, 0, 1); 
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(x, i, x+w, i);
    if((i >= y+(colorSpread*count)) && ( i < y*(colorSpread*(count+1)))) count++;
  }
}

//void sleep(){ //just going to be 2 for now
//  int start = second();
//  if(start == 58) while(second() != 0);
//  else if (start == 59) while(second() != 1);
//  else while((second() - start) >= 2);
//}







  /*
  background(192, 64, 0); //background color (this will be changed a lot later
  stroke(255, 255, 255); //stroke color (will need for vines)
  line(150, 25, 270, 350); //make line(x1, y1, x2, y2)
  //curve(cpx1, cpy1, x1, y1, x2, y2, cpx2, cpy2);
  //better curve
  beginShape();
  curveVertex(40, 40); // the first control point
  curveVertex(40, 40); // is also the start point of curve
  curveVertex(80, 60);
  curveVertex(100, 100);
  curveVertex(60, 120);
  curveVertex(50, 150); // the last point of curve
  curveVertex(50, 150); // is also the last control point
  endShape();
  
  //bezier(x1, y1, cpx1, cpy1, cpx2, cpy2, x2, y2);
  beginShape();
  vertex(50, 75); // first point
  bezierVertex(25, 25, 125, 25, 100, 75);
  endShape();
  
  beginShape();
  vertex(30, 70); // first point
  bezierVertex(25, 25, 100, 50, 50, 100);
  bezierVertex(20, 130, 75, 140, 120, 120);
  endShape();

}

void draw(){ //processing's main

}

//background:
//Set up groups of colors (sunset, cloudy, suny)
//variations within those colors
//animation

//foreground:
//vines (shades of green)
//growing
//funtions and shit

/*
things from practice:

color before shape
fill(r,g,b)
fill(r,g,b,opacity) //opacity max is 255
colorMode(RGB,100,500,10,255); color ranges


void draw() {
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
*/

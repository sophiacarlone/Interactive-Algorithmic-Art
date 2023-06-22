class StrokeObject {
  float BEGINX = -50.0;  // Initial x-coordinate
  float ENDX = 900;   // Final x-coordinate
  
  float beginY;
  float endY;
  float distX;          // X-axis distance to move
  float distY;          // Y-axis distance to move
  float exponent = random(2);   // Determines the curve
  float x = 0.0;        // Current x-coordinate
  float y = 0.0;        // Current y-coordinate
  float step = .01;    // Size of each step along the path
  float pct = 0.0;      // Percentage traveled (0.0 to 1.0)
  color c_;
  float z = random(-10, 10);

  StrokeObject(color c) {
    beginY = random(-300, 900);
    endY = random(-700, 1500);
    c_ = c;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    distX = ENDX - BEGINX;
    distY = endY - beginY;
    
    //fill(0, 2);
    //rect(0, 0, width, height);
    
    pct += step;
    if (pct < 1.0) {
      x = BEGINX + (pct * distX);
      y = beginY + (pow(pct, exponent) * distY);
    }
  
  }

  // Method to display
  void display() {
    //translate(x, y, random(0,10));
    //stroke(c_); 
    //noStroke(); //consider taking this out to make it look cool
    fill(c_, 150);
    ellipse(x, y, 50, 50); 
    translate(0, 0, -5);
    //translate(0, 0, random(-10, 10)); //really funny
  }

  // Is the particle still useful?
  boolean isDead() { //learn to kill
    if (x >= 850) {
      return true;
    } else {
      return false;
    }
  }
}


//class StrokeObject{
//  float beginY = random(601);
//  float endY = random(601);
//  float distX;          // X-axis distance to move
//  float distY;          // Y-axis distance to move
//  float x = 0.0;        // Current x-coordinate
//  float y = 0.0;        // Current y-coordinate
//  float step = 0.01;    // Size of each step along the path
//  float pct = 0.0;      // Percentage traveled (0.0 to 1.0)
  
//  void makeStroke(){
//    distX = ENDX - BEGINX;
//    distY = endY - beginY;
    
//    fill(0, 2);
//    rect(0, 0, width, height);
    
//    pct += step;
//    if (pct < 1.0) {
//      x = BEGINX + (pct * distX);
//      y = beginY + (pow(pct, exponent) * distY);
//    }
    
//    stroke(babyBlue);
//    fill(babyBlue);
//    ellipse(x, y, 50, 50);  
//  }
//}

//void makeStroke(){
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

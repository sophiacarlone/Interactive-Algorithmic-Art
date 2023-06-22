class Cloud {
  float LEFT_ = -50.0 ;  // Initial x-coordinate
  float RIGHT_ = 850;   // Final x-coordinate
  
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
  float deltaX;
  float deltaY;

  Cloud(color c) {
    beginY = random(601);
    endY = random(601);
    deltaX = random(10,25);
    deltaY = random(10,25);
    c_ = c; //later will change for sunny cloud or storm cloud
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    
    distX = RIGHT_ - LEFT_;
    distY = endY - beginY;
    
    //fill(0, 2);
    //rect(0, 0, width, height);
    
    pct += step;
    if (pct < 1.0) {
      //if((int(random(0, 2))) == 1){ x = LEFT_ + (pct * distX); }
      //else { x = RIGHT_ - (pct * distX); }
      x = LEFT_ + (pct * distX);
      y = beginY + (pow(pct, exponent) * distY);
    }
  
  }

  // Method to display
  void display() {
    noStroke();
    beginShape();
    ellipse(x, y, 50, 50);
    fill(255, 255, 255, random(200, 255));
    //translate(0, 0, 50);    
    ellipse(x+deltaX, y-deltaY, 50, 50); 
    fill(255, 255, 255, random(200, 255));
    //translate(0, 0, 50);
    ellipse(x-deltaX, y-deltaY, 50, 50);
    fill(255, 255, 255, random(200, 255));
    //translate(0, 0, 50);
    endShape();
    translate(0, 0, 50);
  }

  // Is the particle still useful?
  boolean isDead() { //learn to kill
    if (x >= 800) {
      return true;
    } else {
      return false;
    }
  }
}

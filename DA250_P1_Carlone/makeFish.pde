class Fish{
  float deltaX = random(10,25);
  float deltaY = random(10,25);
  float x = 0;
  float y = 400;
  
  float BEGINX_e = 900;
  float BEGINY_e = random(0, 600);
  float BEGINX1_t = 950;
  float BEGINX2_t = 975;
  float BEGINX3_t = 975;
  float BEGINY1_t = BEGINY_e;
  float BEGINY2_t = BEGINY_e - 25;
  float BEGINY3_t = BEGINY_e + 25;
  
  float step = 5; 

  float z = random(-10, 15);
  color c =  color(random(200, 255), random(90, 150), 0);
  
  //void Fish(PGraphics pg){
  // pg =  
  //}

  void display(){
    noStroke();
    fill(c);
    
    ellipse(BEGINX_e, BEGINY_e, 80, 50);
    //translate(0, 0, 0); //really funny
    
    triangle(BEGINX1_t, BEGINY1_t, BEGINX2_t, BEGINY2_t, BEGINX3_t, BEGINY3_t);
    //translate(0, 0, z); //really funny
  }
  
  void update(){
    BEGINX_e -= step;
    //BEGINY_e += step;
    BEGINX1_t -= step;
    BEGINX2_t -= step;
    BEGINX3_t -= step;
  }
  
  void run(){
    update();
    display();
  }
  
  boolean isDead() { //learn to kill
    if (x <= -10) {
      return true;
    } else {
      return false;
    }
  }
}

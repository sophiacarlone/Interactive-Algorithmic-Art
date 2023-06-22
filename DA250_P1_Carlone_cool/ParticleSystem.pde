class ParticleSystem {
  ArrayList<StrokeObject> particles;
  //ArrayList<Cloud> clouds;

  ParticleSystem() {
    particles = new ArrayList<StrokeObject>();
    //clouds = new ArrayList<Cloud>();
  }

  void addParticle() {
    particles.add(new StrokeObject(chooseRandomColor()));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      StrokeObject p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  
  color chooseRandomColor(){
    int b = int(random(155, 256));
    int g = int(random(100, 190));
    color c = color(70, g, b);
    return c;
  }
  
  //void addCloud() {
  //  clouds.add(new Cloud(255));
  //}
  
  //void runCloud() {
  //  for (int i = clouds.size()-1; i >= 0; i--) {
  //    Cloud p = clouds.get(i);
  //    p.run();
  //    if (p.isDead()) {
  //      clouds.remove(i);
  //    }
  //  }
  //}
 
}

Walker[] walkers = new Walker[8];
PVector accelerationForce = new PVector(0.2, 0);

void setup() 
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  initWalkers();
}

void initWalkers() 
{
  int n = walkers.length;
  for (int i = 0; i < n; i++) 
  {
    float posY = (Window.windowHeight / (float)n) * (i - (n / 2.0f)) * 2;
    
    walkers[i] = new Walker(i + 1, posY);
  }
}

void draw() 
{
  background(80);
  

  stroke(255, 100);
  line(0, Window.top, 0, Window.bottom);

  for (Walker w : walkers)
  {
    float mew = 0.01f;
    if (w.position.x > 0) 
    {
      mew = 0.4f;
    }

    PVector friction = w.velocity.copy();
    friction.normalize();
    friction.mult(-1);
    friction.mult(mew);
    
    w.applyForce(friction);
    w.applyForce(accelerationForce);
    
    w.update();
    w.render();
  }
}

void mousePressed() {
  initWalkers();
}

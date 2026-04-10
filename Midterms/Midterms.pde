PVector blackHolePos;
Walker[] walkers = new Walker[100];
int framesToReset = 180;

void setup() 
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  initSim();
}

void initSim() 
{
  blackHolePos = new PVector(random(Window.left, Window.right), 
                             random(Window.bottom, Window.top));
  
  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
  }
}

void draw() {
  background(20);
  
  fill(255);
  circle(blackHolePos.x, blackHolePos.y, 50);

  for (int i = 0; i < walkers.length; i++) {
    walkers[i].move(blackHolePos);
    walkers[i].render();
  }
  
  if (frameCount % framesToReset == 0) {
    initSim();
  }
}

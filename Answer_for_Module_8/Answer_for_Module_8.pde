// 1. Declare the array of 10 walkers
Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
    
    walkers[i].mass = random(1, 10);
    walkers[i].scale = walkers[i].mass * 10;
    
    walkers[i].r = random(255);
    walkers[i].g = random(255);
    walkers[i].b = random(255);
  }
}

void draw()
{
  background(255);

  for (int i = 0; i < walkers.length; i++)
  {
    for (int j = 0; j < walkers.length; j++)
    {
      if (i != j) 
      {
        PVector attractionForce = walkers[j].calculateAttraction(walkers[i]);
        walkers[i].applyForce(attractionForce);
      }
    }
    
    walkers[i].update();
    walkers[i].render();
  }
}

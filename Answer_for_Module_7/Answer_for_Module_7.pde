Walker[] walkers = new Walker[10];
Liquid ocean = new Liquid(0, 0, Window.right, Window.bottom, 0.1f);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  int n = walkers.length;
  for (int i = 0; i < n; i++) 
  {
    walkers[i] = new Walker();
    
    float posX = (Window.windowWidth / (float)n) * (i - (n / 2.0f)) + (Window.windowWidth / (n * 2.0f));
    
    walkers[i].position = new PVector(posX, 400); 
    walkers[i].mass = random(1, 8);               
    walkers[i].scale = walkers[i].mass * 15;      
    

    walkers[i].r = random(255);
    walkers[i].g = random(255);
    walkers[i].b = random(255);
  }
}

void draw()
{
  background(255);
  
  ocean.render();

  for (Walker myWalker : walkers) 
  {
    PVector gravity = new PVector(0, -0.15f * myWalker.mass);
    myWalker.applyForce(gravity);
    
    if (ocean.isCollidingWith(myWalker))
    {
      PVector dragForce = ocean.calculateDragForce(myWalker);
      myWalker.applyForce(dragForce);
    }
    
    myWalker.update();
    myWalker.render();
    
    if (myWalker.position.y <= Window.bottom)
    {
      myWalker.position.y = Window.bottom;
      myWalker.velocity.y *= -1;
    }
  }
}

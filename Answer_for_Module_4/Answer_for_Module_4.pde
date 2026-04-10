Walker[] walkers = new Walker[100];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
  }
}

void draw()
{
  background(80);
  
  PVector mouse = mousePos();
  
  for (int i = 0; i < walkers.length; i++) {
    walkers[i].update(mouse);
    walkers[i].render();
    walkers[i].checkEdges();
  }
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

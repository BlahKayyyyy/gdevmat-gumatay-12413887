void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  background(130);
  
  PVector mouse = mousePos();
  
  // Red Glow
  strokeWeight(25);
  stroke(255, 0, 0, 150);
  drawDoubleSaber(mouse);
  
  // Inner white glow
  strokeWeight(8);
  stroke(255);
  drawDoubleSaber(mouse);
  
  // Black Handle
  strokeWeight(15);
  stroke(0); 
  PVector handleLimit = mouse.copy().normalize().mult(40); 
  line(-handleLimit.x, -handleLimit.y, handleLimit.x, handleLimit.y);

  println("Magnitude: " + mouse.mag());
}

void drawDoubleSaber(PVector v)
{
  line(0, 0, v.x, v.y);
  line(0, 0, -v.x, -v.y);
}

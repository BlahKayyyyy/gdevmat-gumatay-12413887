public class Walker 
{
  public PVector position = new PVector(0, 0);
  public PVector speed = new PVector(5, 8);
  
  public float tx = 0, ty = 10000; 
  public float ts = 5000;          
  public float tr = 20000, tg = 30000, tb = 40000; 

  void render() 
  {
    noStroke();
    float r = map(noise(tr), 0, 1, 0, 255);
    float g = map(noise(tg), 0, 1, 0, 255);
    float b = map(noise(tb), 0, 1, 0, 255);
    
    fill(r, g, b);
    circle(position.x, position.y, 50);
  }

  void moveAndBounce() 
  {
    position.add(speed); 

    if ((position.x > Window.right) || (position.x < Window.left)) 
    {
      speed.x *= -1; 
    }
    
    if ((position.y > Window.top) || (position.y < Window.bottom)) 
    {
      speed.y *= -1; 
    }
  }
}

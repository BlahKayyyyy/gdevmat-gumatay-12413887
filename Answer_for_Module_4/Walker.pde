public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;

  public Walker()
  {
    this.position.x = random(Window.left, Window.right);
    this.position.y = random(Window.bottom, Window.top);
    this.scale = random(10, 30);
  }

  public void update(PVector target)
  {
    this.acceleration = PVector.sub(target, this.position);
    
    this.acceleration.normalize();
    
    this.acceleration.mult(0.2);
    
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }

  public void render()
  {
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges()
  {
    if (this.position.x > Window.right) this.position.x = Window.left;
    else if (this.position.x < Window.left) this.position.x = Window.right;
    
    if (this.position.y > Window.top) this.position.y = Window.bottom;
    else if (this.position.y < Window.bottom) this.position.y = Window.top;
  }
}

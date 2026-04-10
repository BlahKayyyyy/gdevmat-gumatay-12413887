public class Walker {
  public PVector position = new PVector(-500, 200);
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float mass;
  public float scale;
  public float r, g, b;

  public Walker(float m) 
  {
    this.mass = m;
    this.scale = m * 15;
    
    this.r = random(255);
    this.g = random(255);
    this.b = random(255);
  }
  
  public void applyForce(PVector force) 
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }

  public void update()
  {
    this.velocity.add(this.acceleration);
    this.position.add(this.velocity);
 
    this.acceleration.mult(0); 
  }

  public void render() 
  {
    fill(r, g, b);
    circle(position.x, position.y, scale);
  }
  
  public void bounceEdges() 
  {
    if (this.position.x > Window.right) 
    {
      this.position.x = Window.right;
      this.velocity.x *= -1;
    } 
    else if (this.position.x < Window.left) 
    {
      this.position.x = Window.left;
      this.velocity.x *= -1;
    }
    
    if (this.position.y > Window.top) 
    {
      this.position.y = Window.top;
      this.velocity.y *= -1;
    } 
    else if (this.position.y < Window.bottom) 
    {
      this.position.y = Window.bottom;
      this.velocity.y *= -1;
    }
  }
}

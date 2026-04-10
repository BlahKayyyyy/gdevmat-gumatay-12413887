public class Walker 
{
  public PVector position;
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float mass;
  public float scale;
  public float r, g, b;

  public Walker(float m, float y) 
  {
    this.mass = m;
    this.scale = m * 10;
    this.position = new PVector(Window.left, y);
    
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
    noStroke();
    circle(position.x, position.y, scale);
  }
}

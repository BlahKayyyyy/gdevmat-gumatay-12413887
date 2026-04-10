public class Walker {
  public PVector position;
  public float scale;
  public int r, g, b;

  public Walker() {
    float x = randomGaussian() * 200; 
    float y = randomGaussian() * 200;
    position = new PVector(x, y);
    
    scale = random(5, 15);
    r = (int)random(255);
    g = (int)random(255);
    b = (int)random(255);
  }

  void render() {
    fill(r, g, b, 200);
    noStroke();
    circle(position.x, position.y, scale);
  }

  void move(PVector target) {
    PVector direction = PVector.sub(target, position);
    

    direction.normalize();
    direction.mult(10);
    
    position.add(direction);
  }
}

void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw()
{
  float gaussian = randomGaussian();
  println(gaussian);

  float standardDeviation = 500;
  float mean = 0;

  float x = standardDeviation * gaussian + mean;

  noStroke();

  fill(255, 10);
  circle(x, 0, 30);
}

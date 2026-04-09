void setup()
{
  size(1020, 720, P3D);
  background(0);
}


void draw() {
  float Gaussian = randomGaussian();
  float StandardDeviation = 100;
  float Mean = width / 2;
  float x = (Gaussian * StandardDeviation) + Mean;

  float y = random(0, height); 

  float sizeGaussian = randomGaussian();
  float sizeSD = 8;
  float sizeMean = 20;
  float thickness = (sizeGaussian * sizeSD) + sizeMean;

  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(10, 100);

  noStroke();
  fill(r, g, b, a);
  circle(x, y, thickness);
}

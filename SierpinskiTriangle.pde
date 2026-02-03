float triangleRotation = 0;
float triangleSize = 500;
int depth = 3;

public void setup()
{
  size(750, 750);
}
public void draw()
{
  background(color(0, 0, 0));
  noStroke();
  translate(width / 2, height / 2);
  rotate(triangleRotation);
  sierpinski(0, -(int)triangleSize / 2, (int)triangleSize, depth);
}
public void mouseDragged()//optional
{
  double centerMouseX = mouseX - width / 2;
  double centerMouseY = mouseY - height / 2;
  triangleRotation = -(float)Math.atan2(centerMouseX, centerMouseY);
  triangleSize = (float)Math.max(200, Math.sqrt(centerMouseX * centerMouseX + centerMouseY * centerMouseY));
}
public void mouseClicked() {
  if (mouseButton == LEFT) {
    depth++;
    if (depth > 6) { depth = 6; }
  } else {
    depth--;
    if (depth < 0) { depth = 0; }
  }
}
public void sierpinski(int x, int y, int len, int depth) 
{
  if (depth <= 0) {
    triangle(x - len / 2, y, x + len / 2, y, x, y + len);
    return;
  }
  sierpinski(x - len / 4, y, len / 2, depth - 1);
  sierpinski(x + len / 4, y, len / 2, depth - 1);
  sierpinski(x, y + len / 2, len / 2, depth - 1);
}

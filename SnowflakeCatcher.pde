Snowflake [] flakes;
void setup()
{
  size(500, 500);
  background(0);
  flakes = new Snowflake[100];
  for(int i = 0; i < flakes.length; i++)
  {
    flakes[i] = new Snowflake();
  }
}

void draw()
{
  for(int i = 0; i < flakes.length; i++)
  {
    flakes[i].erase();
    flakes[i].lookDown();
    flakes[i].move();
    flakes[i].wrap();
    flakes[i].show();
  }
}

class Snowflake
{
  int x, y, d;
  boolean isMoving;
  Snowflake()
  {
    x = (int)(Math.random()*501);
    y = (int)(Math.random()*501) - 500;
    d = (int)(Math.random()*4) + 7;
    isMoving = true;
  }
  void erase()
  {
    fill(0);
    ellipse(x, y, d + 2, d + 2);
  }
  void move()
  {
    if(isMoving == true)
    {
      y++;
    }
  }
  void lookDown()
  {
    if(y > 0 && y < 500 && (get(x, y + d) == color(26, 206, 246) || 
                            get(x + d, y) == color(26, 206, 246) || 
                            get(x - d, y) == color(26, 206, 246)))
     {
      isMoving = false;
     }
     else
     {
      isMoving = true;
     }
  } 
  void show()
  {
    fill(255);
    ellipse(x, y, d, d);
  }
  void wrap()
  {
    if(y > 490)
    {
      x = (int)(Math.random()*501);
      y = (int)(Math.random()*501) - 500;
    }
  }
}

void mouseDragged()
{
  noStroke();
  if(mouseButton == LEFT)
  {
    fill(26, 206, 246);
    ellipse(mouseX, mouseY, 15, 15);
  }
  else
  {
    fill(0);
    ellipse(mouseX, mouseY, 15, 15);
  }
}

void keyPressed()
{
  background(0);
}

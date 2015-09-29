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
  int x, y;
  boolean isMoving;
  Snowflake()
  {
    x = (int)(Math.random()*501);
    y = (int)(Math.random()*501);
    isMoving = true;
  }
  void erase()
  {
    fill(0);
    ellipse(x, y, 7, 7);
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
    if(y > 0 && y < 500 && get(x, y + 1) != color(0))
     {
      isMoving = false;
     }
  } 
  void show()
  {
    fill(255);
    ellipse(x, y, 5, 5);
  }
  void wrap()
  {
    if(y > 498)
    {
      x = (int)(Math.random()*501);
      y = 0;
    }
  }
}

void mouseDragged()
{
  fill(255, 0, 0);
  noStroke();
  ellipse(mouseX, mouseY, 15, 15);
}

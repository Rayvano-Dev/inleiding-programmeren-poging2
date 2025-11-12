final int X_SPEED = 1;
final int Y_SPEED = 1;

int headX = 250;
int headY = 250;

int snakeSize=15;

int applex= (round(random(97))+10)+80;
int appley= (round(random(97))+10)+80;

boolean redo=true;
boolean stopgame=false;


void setup()
{
  size(500,500);
}

void draw()
{
  background(192);
  fill(255);
  moveSnake();
  
  if(headX >= 500 || headX <= 0)
  {
    background(0); 
  }
  
  if(headY >= 500 || headY <= 0)
  {
    background(0); 
  }
  
  fill(255,0,0);
   stroke(0);
   rect(applex,appley,8,8);
}

void moveSnake() //For moving the snake
{
  if(keyCode == RIGHT)
  {
    drawSnakeX();
    headX += X_SPEED; 
  }
  else if(keyCode == LEFT)
  {
    drawSnakeX();
    headX -= X_SPEED;
  }
  else if(keyCode == UP)
  {
    drawSnakeY();
    headY -= Y_SPEED;
  }
  else if(keyCode == DOWN)
  {
    drawSnakeY();
    headY += Y_SPEED;
  }
}

void drawSnakeX() //Drawing the snake X-Axis
{
  for(int i = 0 ; i < 3; i++)
  {
    if(keyCode == RIGHT)
    {
       ellipse(headX - i*snakeSize, headY, snakeSize, snakeSize); 
    }
    else if(keyCode == LEFT)
    {
       ellipse(headX + i*snakeSize, headY, snakeSize, snakeSize);
    }
  }
}

void drawSnakeY() //Drawing the snake Y-Axis
{
  for(int i = 0; i < 3; i++)
  {
    if(keyCode == UP)
    {
       ellipse(headX, headY + i*snakeSize, snakeSize, snakeSize);
    }
    else if(keyCode == DOWN)
    {
       ellipse(headX, headY - i*snakeSize, snakeSize, snakeSize);
    }
  }
}

void display() //Displaying the snake and the apple
{
  if (headX==applex && headY==appley)
  {
    snakeSize=round(random(30)+1);
    redo=true;
    while(redo)
    {
      applex=(round(random(97))+10)+80;
      appley=(round(random(497))+10)+80;
      for(int i=0; i<snakeSize; snakeSize++)
      {
        if (applex==headX*i && appley== headY*i)
        {
          redo=true;
        }
        else
        {
          redo=false;
        }
      }
    }
  }
  stroke(255,255,255);
  fill(0);
  ellipse(headX,headY,8,8);
  fill(255);
  ellipse(headX*snakeSize,headY*snakeSize,8,8);
}


void checkdead()  //Ending the game
{
  for(int i=2;i<snakeSize;i++)
  {
    if (headX==headX*i && headY==headY*i)
    {
      fill(255);
      rect(125,125,160,100);
      fill(0);
      text("EXIT",200,150);
      text("RESTART",200,175);
      text("PRESS SHIFT TO RESTART",200,200);
      stopgame=true;
    }
  }
}

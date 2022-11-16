//残像を作ってみようかな

void setup()
{
    size(500,400);
    background(0);
}

float  x = 300;
float  y = 200;

int r = 180;

void draw()
{
    fill(0,15);
    noStroke();
    rect(0,0,600,400);
    
    noFill();
    
    x = x + random(-3 , 3);
    y = y + random(-3 , 3);
    
    stroke(random(255) , random(255) ,random(255));
    
    ellipse(x , y ,r , r);
}

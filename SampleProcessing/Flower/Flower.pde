//花

int width  = 400;
int height = 400;

float[] position1 = new float[2];
float[] position2 = new float[2];
int radius = 250;
float seed1;
float seed2;
float d;

void setup()
{
  size(800,800);
  background(0);
  d = TWO_PI / 360;
  
   seed1 = random(1,150);
   seed2 = random(1,150); 
}

void draw()
{
    push();
    translate(width , height);
    float noise1 = noise(seed1 + 0.02f  *  frameCount) * radius ;
    float noise2 = noise(seed2 + 0.02f  *  frameCount) * radius;
    
    position1[0] = cos(d * frameCount) * noise1;
    position1[1] = sin (d * frameCount) * noise1;
    position2[0] = cos(d * frameCount + HALF_PI) * noise2;
    position2[1] = sin (d * frameCount + HALF_PI) * noise2;
    
    stroke(frameCount / 5);
    stroke(random(0) , random(200) , random(170));
    
    if(frameCount > 2500)
    {
      noLoop();
    }
    
    line(position1[0] , position1[1] , position2[0] , position2[1] );
    pop();
}

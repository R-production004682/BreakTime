int[][] result; 
float t;
float c; 



float c01(float x)
{
  return constrain(x,0,1);
}

PVector rotZ(PVector v,float theta)
{
  float x = v.x*cos(theta) - v.y*sin(theta);
  float y = v.x*sin(theta) + v.y*cos(theta);
  return new PVector(x,y,v.z);
}

PVector rotY(PVector v,float theta)
{
  float x = v.x*cos(theta) - v.z*sin(theta);
  float z = v.x*sin(theta) + v.z*cos(theta);
  return new PVector(x,v.y,z);
}

PVector rotX(PVector v,float theta)
{
  float y = v.y*cos(theta) - v.z*sin(theta);
  float z = v.y*sin(theta) + v.z*cos(theta);
  return new PVector(v.x,y,z);
}


void draw()
{
  if (!recording)
  { 
    t = (mouseX*1.3/width)%1;
    c = mouseY*1.0/height;
    if (mousePressed)
      println(c);
    draw_();
  }
  else 
  { 
    for (int i=0; i<width*height; i++)
      for (int a=0; a<3; a++)
        result[i][a] = 0;

    c = 0;
    for (int sa=0; sa<samplesPerFrame; sa++) {
      t = map(frameCount-1 + sa*shutterAngle/samplesPerFrame, 0, numFrames, 0, 1);
      t %= 1;
      draw_();
      loadPixels();
      for (int i=0; i<pixels.length; i++) {
        result[i][0] += red(pixels[i]);
        result[i][1] += green(pixels[i]);
        result[i][2] += blue(pixels[i]);
      }
    }

    loadPixels();
    for (int i=0; i<pixels.length; i++)
      pixels[i] = 0xff << 24 | 
        int(result[i][0]*1.0/samplesPerFrame) << 16 | 
        int(result[i][1]*1.0/samplesPerFrame) << 8 | 
        int(result[i][2]*1.0/samplesPerFrame);
    updatePixels();
    
    if (frameCount<=numFrames) {
      saveFrame("data/fr###.gif");
      println(frameCount,"/",numFrames);
    }
    
    if (frameCount==numFrames)
      stop();
  }
}


int samplesPerFrame = 8;
int numFrames = 330;        
float shutterAngle = 0.8;

boolean recording = false;

PFont mono;

int numberOfDigits = 210;
float R = 125; 


float cameraZ()
{
  return 300.0;
}

PVector positionTransform(PVector v)
{
  PVector res;
  res = rotZ(v.copy(), 0.17 * PI + 0.03 * PI * sin(TAU*(t-0.3))); 
  return res;
}

float projectionFactor = 440.0;

void showParticle(PVector position,float sizeFactor,boolean isDigit,int digitValue,float alphaFactor)
{
  position = positionTransform(position);
 
  float alphaFactor2 = map(position.z,-R,R,0.45,1.3) * alphaFactor;
  
  float zDistanceFromCamera = cameraZ() - position.z;
  if(zDistanceFromCamera > 0)
  {

    float x2D = projectionFactor * position.x / zDistanceFromCamera;
    float y2D = projectionFactor * position.y / zDistanceFromCamera;
    
    PVector pixelPosition = new PVector(x2D,y2D);

    if(isDigit)
    {
      float textSz = 29;
      float scl = 0.1 * sizeFactor * projectionFactor / zDistanceFromCamera; 
    
      push();
      translate(pixelPosition.x -0.5*textSz/2, pixelPosition.y + 0.5*textSz/2);
      scale(scl);
      rotate(0.03 * sin(TAU*(t-0.3)) * PI);
      
      fill(255,alphaFactor2 * 275);
      noStroke();
      textSize(textSz);
      
      text(digitValue,0,0);
      
      pop();
    }
    else
    {
      float sz = sizeFactor * projectionFactor / zDistanceFromCamera;
      
      stroke(255,21 * alphaFactor2);
      strokeWeight(sz);
    
      point(pixelPosition.x,pixelPosition.y);
    }
  }
}

void showDashedCurve()
{
  int dashParam = 20;
  
  float R2 = 1.05*R; 

  int m = 1000;
  for(int i=0;i<m;i++)
  {
    if(i%(2*dashParam) > dashParam) continue;
    
    // spherical coordinates
    float theta = map((i + 38 * t * float(dashParam)) % m, 0, m, 0, PI); 
    float phi = (t + 0.006) * TAU;

    float x = R2*sin(theta)*cos(phi);
    float y = R2*cos(theta);
    float z = R2*sin(theta)*sin(phi);
    
    PVector pos = new PVector(x,y,z);
    float sizeFactor = 0.73;
    boolean isDigit = false;
    float alphaFactor = 14.0;
    
    showParticle(pos, sizeFactor, isDigit, 0, alphaFactor);
  }
  
  
  PVector pole1Position = new PVector(0,R2,0);
  PVector pole2Position = new PVector(0,-R2,0);
  showParticle(pole1Position, 4, false, 0, 1000);
  showParticle(pole2Position, 4, false, 0, 1000);
}

class Digit
{
  PVector position0;
  int digitValue;
  
  Digit(int i)
  {
    digitValue = i%10;

    float phi = PI * (3. - sqrt(5.));
    float theta = phi*i;
    float y = map(i,0,numberOfDigits-1,1,-1);
    float radius = sqrt(1 - y * y);
    y *= R;
    float x = cos(theta) * R * radius;
    float z = sin(theta) * R * radius;
    
    position0 = new PVector(x,y,z);
  }
  
  void show(float p)
  {
    float delayFromAngle = atan2(position0.z,position0.x)/TAU;

    float delay = delayFromAngle / 2;
    
    float delayedP = (1234 + p - delay)%1;
    float angleChangeProgress = -pow(1-delayedP,2.0);

    

    PVector position = rotY(position0, angleChangeProgress * TAU);
    
    

    float wo = (1234 - 4*p + delayFromAngle)%1;
    float wv = pow(c01(sin(PI*wo)),3.3);
    float sizeFactor = 2.8 + 1.3*wv;

    float bumpMax = 0.5;
    float bump = 1 + bumpMax*pow(1-c01(27*delayedP),2.3);
    float bump2 = 1 + bumpMax*pow(1-c01(100*(1-delayedP)),2.0);
    
    float sizeFactor2 = sizeFactor * bump * bump2;
    boolean isDigit = true;
    float alphaFactor = 1.0;
    
    showParticle(position, sizeFactor2, isDigit, digitValue, alphaFactor);
  }
  
  void show()
  {
    int K = 2;
    for(int i=0;i<K;i++)
    {
      show((i+t)/K);
    }
  }
}

ArrayList<Digit> digitsArray = new ArrayList<Digit>();

void setup()
{
  size(600,600,P2D);
  result = new int[width*height][3];
  smooth(8);

  for(int i=0;i<numberOfDigits;i++)
  {
    digitsArray.add(new Digit(i));
  }
}


void draw_()
{
  background(0);
  push();
  translate(width/2,height/2);
  
  for(Digit digit : digitsArray)
  {
    digit.show();
  }
  
  showDashedCurve();
  
  pop();
}

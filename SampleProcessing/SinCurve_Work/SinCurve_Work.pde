//サインカーブを書いてみる
float width = 1000;
float height = 1000;
float toll = 650;

void setup()
{
    size(1000,1000);
    background(0);
}

void draw()
{
    background(0);
    
    for(var j = 0; j <55; j++)
    {
        var seed = (j - frameCount) * 0.02;
        var y = noise(seed) * toll - toll /  2 + height / 4 * sin(0) + height / 2;
        stroke(color(noise(seed)  * 255, noise(seed + 1) * 255 , noise(seed + 2) * 255));
        
        for(var i = 0; i < width; i += 4)
        {
           var noiseY = noise(seed + 0.01f * (i  + 1)) * toll - toll / 2 + height / 4 * sin(TWO_PI / 360 * i * 0.8) + height / 2;
           line(i , y , i + 3 , noiseY);
           y = noiseY;
          
        }
        
    }
 
}

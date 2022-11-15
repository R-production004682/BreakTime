//こんな感じで四方向からかっこよく塗ることもできる

void setup()
{
    size(700 , 700);
}

void draw()
{
    line(0 ,300,700 , frameCount * 10 - 3000);
    line(0 ,300,700 ,-frameCount * 10 + 3500);
    line(0 , frameCount * 10 - 3000 , 700 , 300);
    line(0 ,-frameCount * 10 + 3500 , 700 , 300);
}

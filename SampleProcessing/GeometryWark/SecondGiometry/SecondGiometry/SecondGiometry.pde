//幾何学模様を作ってみたい
//今回もline関数を使って造ってみるヨ

void setup()
{
    size(700 , 700);
}

void draw()
{
    line(0 ,300,700 , frameCount * 10 - 3000);
    line(0 , frameCount * 10 - 3000 , 700 , 300);
}

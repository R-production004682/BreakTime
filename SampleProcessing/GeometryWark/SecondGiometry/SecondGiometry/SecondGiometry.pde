//初めての幾何学模様を作ってみたので、もう少し模様っぽくしたい。
//今回もline関数を使ってみるヨ

void setup()
{
    size(700 , 700);
}

void draw()
{
    line(0 ,300,700,frameCount * 10 - 3000);
    line(0 , frameCount * 10 - 3000 , 700 , 300);
}

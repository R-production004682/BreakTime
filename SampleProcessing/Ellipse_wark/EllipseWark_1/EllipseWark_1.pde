//マウスを使った動き
//丸をぐにゃぐにゃさせるよ

void setup()
{
  size(500,500);
}
void draw()
{
  background(200);
  ellipse(250 ,250 ,mouseX , mouseY);
}

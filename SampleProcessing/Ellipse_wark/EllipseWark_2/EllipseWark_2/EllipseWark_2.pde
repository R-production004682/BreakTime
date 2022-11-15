//円をぐにゃぐにゃさせたい
//X軸に動かしたとき、Y軸に動かしたときにわかりやすいように色を変えたい
//引き伸ばせば伸ばすだけ色を変えたい

void setup()
{
   size(500,500);  
}
void draw()
{
  background(200);
  ellipse(250,250,mouseX , mouseY);
  
  //色を変えるよ
  fill(mouseX / 3 , mouseY / 3 , mouseX * mouseY);
}

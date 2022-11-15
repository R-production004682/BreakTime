//幾何学模様を作ったので今度は遠近感のある図形を作ってみちゃい
//マウスで制御もしてみたいですよね

void setup()
{
    size(1000,1000);
    background(0);
}

void draw()
{
  //なんか繊維みたいだね
  ellipse(mouseX , mouseY,mouseY,mouseY);
  noFill();
  stroke(255,255,255);
}

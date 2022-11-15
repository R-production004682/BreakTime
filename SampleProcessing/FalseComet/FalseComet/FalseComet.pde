//尾を引く彗星っぽいの作ってみる。
//なんかが降ってきてるとこってきれいだよね

void setup()
{
  size(600,600);
  background(0,0,0);
}

void draw()
{
  //塗りつぶさないって意味
    noFill();
    
    stroke(random(180) , random(255) , random(180));
    line(frameCount,frameCount,random(frameCount / 2) - 400
          , random(frameCount / 2) - 400);

}

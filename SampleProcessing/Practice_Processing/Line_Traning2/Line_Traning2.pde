//Line_Traning2
//今度は変数を使って値を制御してみよう

void draw()
{
  //こんな感じで書ける
  int posX  = 5;
  int posY  = 60;
  line(posX         ,posY  , posX + 20 , posY - 40);//line(5,60,25,20)になってる
  line(posX + 10 , posY , posX + 30 , posY - 40);
  line(posX + 20 , posY , posX + 40 , posY - 40);
  line(posX + 30 , posY , posX + 50 , posY - 40);
  line(posX + 40 , posY , posX + 60 , posY - 40);
  line(posX + 50 , posY ,posX + 70  , posY - 40);
}

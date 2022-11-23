//色々調べててかっこいい物を見つけたので作ってみる。
//ベジェ曲線
//ベジェ曲線とは、Ｎ個の制御点から得られる
//Ｎ - 1次曲線の事

int height  = 250;
int width = 500;

void setup()
{
    size(1000,1000);
    background(0);
}

void draw()
{
  noLoop();
  noFill();
  
  for(int curveX = 0; curveX < 1000; curveX++)
  {
    float[] array = new float[4] ;
    
    for(int  curveY = 0;  curveY < 4; curveY++ )
    {
      array[curveY]  = random(curveY) * 2;  
    }
    
    stroke(color (array[0] * 0 , array[1] * 200 , array[2] * 150 , 100));
    bezier(width / 2, height / 2 ,array[0] * width ,array[1] * height , array[2] * width , array[3] * height , width / 2 , height / 2);
  }
  
}

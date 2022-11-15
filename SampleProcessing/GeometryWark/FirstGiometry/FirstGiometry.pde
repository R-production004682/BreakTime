//processingといえば、幾何学模様ですよね
//ラインを使ってかっこいいの作っちゃいましょう！

void setup()
{
  size(750,750);
}

void draw()
{
  //line関数は、点（第一引数　、第二引数）を始点として、点（第三引数　、第四引数）を結ぶ線のこと。
  
  line(200 + frameCount , 200 - frameCount , 500 - frameCount / 2 , 500 + frameCount / 2);
  line(400 + frameCount , 400 + frameCount , 200 + frameCount / 2 , 600 + frameCount / 4);
  line(20 - frameCount / 2 ,200 + frameCount , 700 + frameCount / 3 , 100 - frameCount / 2 );
}

//色々触って遊んでみよう！
//training用
void draw()
{
  //line(下のX座標、下のY座標、上のX座標、上のY座標);
  /* 
    line(10 , 80 , 30 , 40); 
    line(20 , 80 , 40 , 40);
    line(30 , 80 , 50 , 40);
    line(40 , 80 , 60 , 40);
    line(50 , 80 , 70 , 40);
    line(60 , 80 , 80 , 40);
    */
  
   //l背景色と、線の色も変えてみる。
   //イベントも入れて、カラーを反転させてみる。
   if(mousePressed)
   {
     mousePressed();
   }
   else
   {
     background(255);
     stroke(0);
     strokeWeight(5);
    line(10 , 80 , 30 , 40); 
    line(20 , 80 , 40 , 40);
    line(30 , 80 , 50 , 40);
    line(40 , 80 , 60 , 40);
    line(50 , 80 , 70 , 40);
    line(60 , 80 , 80 , 40);
    
      fill(0);
      text("SampleLine1" , 10 , 30); 
   }
    
}
void mousePressed()
{ 
  background(0);
  stroke(255);
  strokeWeight(5);
    line(10 , 80 , 30 , 40); 
    line(20 , 80 , 40 , 40);
    line(30 , 80 , 50 , 40);
    line(40 , 80 , 60 , 40);
    line(50 , 80 , 70 , 40);
    line(60 , 80 , 80 , 40);
    
      fill(255);
      text("SampleLine2" , 10 , 30); 
}

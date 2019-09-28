function [flag,gcd]  = is_coprime(x,y)
% 判断两正整数是否互质
%输出:
%flag : 是否互质
% gcd : x和y的最大公约数

%输入:
%x,y:两个正整数
 %x,y,则两数交换
 if x<y
       tmp =x ;
       x=y;
       y=tmp;
 end   
 
 %用求商法判断
 while(true)
      z =mod(x,y);
      if(z==0)
          break;
      else
           x=y;
           y=z;
     end   
 end   
 if (y==1)
       flag =true;
       gcd=1;
 else
       flag =false;
       gcd=y;
 end   
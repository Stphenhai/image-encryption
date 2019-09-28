function cipherout=diffusionmatrixfinield(I,p2,q2,p3,q3)
% 构造矩阵C 1 = [? k ] 256?256 , ?是F 2 8 的本原元素，当i + j ≤ 255 时，k =
% i + j，i + j > 255 时，k = 512 ? i ? j, i,j = 0,1,···,255. 得到矩阵C
% clear,clc;
% I=imread('lena.bmp');
x = gf(0:255,8);
 I1=gf(I,8);
u=x(3);
% [m,n]=size(I);
m=256;
n=256;
C=x*x';
for i=1:m
 for j=1:n
         if(i+j-2<=255)
               k=i+j-2;
              C(i,j)=u.^k;
         else
              k=510-(i+j-2);
              C(i,j)=u.^k;
         end    
 end
end 
% 我们可以得到矩阵C是对称且可逆的，为了增加破译的难度，我们选取
% 一个置换多项式g(x) = x 59 + x 149 + x 254 , 得到新的矩阵C 1 = [g β (?)], β =
% q 2/p 2 ,
% 其中(255,p 2 ) = 1,(255,q 2 ) = 1,(p 2 ,q 2 ) = 1,1 < p 2 < 2 10 ,β ∈ (0,255),
% q2=1913;
% p2=19133;   
 D=((C.^59+C.^149+C.^254).^(q2)).^(-p2+255);
 D1=((C.^59+C.^149+C.^254).^(q3)).^(-p3+255);
%  I=gf(I,8);
cipherout=D*I1*D1';

% %第一次正交变换，DSD
%  cipherouttemp=D*I1*D';
%  %第二次正交变换   DSD
%  cipherout=D*cipherouttemp*D';
 
%   F=(D)^(-1);
%  plainout=cipherout*F;
%  subplot(2,2,1),imshow(I);
%  cc=C.x;
%  subplot(2,2,2),imshow(uint8(cc));
%  dd=D.x;
%  subplot(2,2,3),imshow(uint8(dd));
%  ci=cipherout.x;
%  subplot(2,2,4),imshow(uint8(ci));
%  pl=plainout.x;
%  figure,imshow((uint8(pl)));
 
 
%  F=(D)^(-1);
%  g=inv(D);  %求实对称矩阵的逆

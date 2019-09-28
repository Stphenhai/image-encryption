function plainout=idiffusionmatrixfinield(I,p2,q2,p3,q3)
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

% q2=1913;
% p2=19133;   

 D=((C.^59+C.^149+C.^254).^(q2)).^(-p2+255);
 D1=((C.^59+C.^149+C.^254).^(q3)).^(-p3+255);
 F=(D)^(-1);
 G=(D1')^-1;
plainout=F*I1*G;

% plainouttemp=F*I1*G;          %第一次正交变换
% plainout=F*plainouttemp*G;    %第二次正交变换
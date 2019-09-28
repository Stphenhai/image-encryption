function outImg=positionscramble(I)
%%类似于猫映射变换的置换多项式的置乱   256*256图像
%置乱(正变换);
 xx = gf(0:255,8); % 生成1*256一维有限域
m0=zeros(1,256);
for i=0:255
    m0(i+1)=i;
end  
w0=xx(3).^double(m0);
w0(256)=0;

%行置换密钥
e1=xx(3)^11;
p1=191;
q1=193;
% q2 = 127;
% p2 = 181;
%行置换多项式
w1=(((w0+e1).^59+(w0+e1).^209+(w0+e1).^254).^(q1)).^(-p1+255);

%列置换密钥
e2=xx(3)^19;   
% % w2=((w0+e2).^59+(w0+e2).^209+(w0+e2).^254).^(q1/p1);
w2=(((w0+e2).^59+(w0+e2).^209+(w0+e2).^254).^(q1)).^(-p1+255);
% w22=w2.x;


%%类似于猫映射变换的置换多项式的置乱
%置乱(正变换);
tempImg=I;
outImg = I;
[m,n]=size(I);
for u=1:m
    for v=1:n
             temp = tempImg(u,v);     %获取坐标（U,V）的像素值
             ax=w1(u);
             ay=w2(v);
             axx=ax.x+1;
             ayy=ay.x+1;
             outImg(axx,ayy) = temp;          %在新的坐标中附上原来的像素值
    end   
end 

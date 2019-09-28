clear;clc;

% I=imread('lake.tiff');     %512*512 图像
% I=imread('boat256.tiff');      %256*256图像
% I=imread('peper256.bmp');      %256*256图像
I=imread('barb256.bmp');      %256*256图像
% I=imread('goldhill256.bmp');      %256*256图像
% I=imread('baboon256.bmp');      %256*256图像
% I=imread('camera256.tiff');      %256*256图像     信息熵：原图(7.0097)    加密后的图(7.9971)
% I(64,64)=128;            %抗差分攻击  一个像素不同
% [m,n]=size(I);
x = gf(0:255,8); % 生成1*256一维有限域
% I=imread('lena.bmp');
[m,n]=size(I);
C=x(3).^double(I);
q1 = 127;
p1 = 181;
e = x(3)^127;
D=valuescramble(C,e,p1,q1);
%类似于猫映射置乱
P=positionscramble(D);
% % 裁剪分析
% for i=1:128
%     for j=1:128
%            P(i,j)=0;
%     end   
% end    

%构 造 有 限 域 上 的 实 对 称 矩 阵 ,并正交化，扩散和置乱。
%  正交扩散密钥  
q2=1021; p2=1019;  
q3=42787;
p3=332851;
F=diffusionmatrixfinield(P,p2,q2,p3,q3);
q22=40771;p22=332837;        %密钥p,q出现一个变换 q22=40801;p22=332873; 
% InverseF=idiffusionmatrixfinield(F,p2,q2,p3,q22);
InverseF=idiffusionmatrixfinield(F, p2,q2,p3,q3);
InverseP=ipositionscramble(InverseF);
%密钥分析   q1+4;
% IverseD=ivaluescramble(InverseP,e,p1,q1);
e1=x(3)^17;
p11=590321;
IverseD=ivaluescramble(InverseP,e,p1,q1);
IverseO=iorignal(IverseD);
cc=C.x;
dd=D.x;
pp=P.x;
ff=F.x;
iff=InverseF.x;
ipp=InverseP.x;
idd=IverseD.x;
oo=IverseO.x;
figure;
subplot(2,4,1),imshow(I); title('原图');
subplot(2,4,2),imshow(uint8(cc));   title('有限域上图像')
subplot(2,4,3),imshow(uint8(dd));  title('数值置乱后的图像');
subplot(2,4,4),imshow(uint8(pp));  title('位置置乱后的图像');
subplot(2,4,5),imshow(uint8(ff));   title('正交扩散后的图像'); 
subplot(2,4,6),imshow(uint8(iff));     title('逆正交扩散后的图像');
subplot(2,4,7),imshow(uint8(ipp)); title('逆位置置乱后的图像');
subplot(2,4,8),imshow(uint8(idd));   title('逆数值置乱后的图像');
figure,imshow(uint8(oo)) ;             title('解密后的图像');
% imwrite(uint8(ff),'encryptedbarb256.bmp');
x=psnr(I,uint8(oo));

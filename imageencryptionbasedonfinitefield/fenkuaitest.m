clear;
clc;
I=imread('lake.tiff');
x = gf(0:255,8); % 生成1*256一维有限域
% I=imread('lena.bmp');
[m,n]=size(I);
C=x(3).^double(I);
q1 = 127;
p1 = 181;
e = x(3)^127;
%第一步置乱(加密)：值置乱
D=valuescramble(C,e,p1,q1);
%第二步置乱(加密)：行列搬移 置乱512*512
P=rowcolpositionscramble(D);
%第三步加密：先均等分成4块，然后进行正交扩散
q2=1021; p2=1019;  
q3=1913;
p3=19133;   
t=256;
num=[1 2 3 4];
I1=fenkuai(t,P,num(1));
I2=fenkuai(t,P,num(2));
I3=fenkuai(t,P,num(3));
I4=fenkuai(t,P,num(4));
I11=diffusionmatrixfinield(I1,p2,q2,p3,q3);
I12=diffusionmatrixfinield(I2,p2,q2,p3,q3);
I13=diffusionmatrixfinield(I3,p2,q2,p3,q3);
I14=diffusionmatrixfinield(I4,p2,q2,p3,q3);
F=[I11,I12;I13,I14];
%第三步解密：先将加密后的图像均等分成4块，然后进行正交扩散
II1=idiffusionmatrixfinield(I11,p2,q2,p3,q3);
II2=idiffusionmatrixfinield(I12,p2,q2,p3,q3);
II3=idiffusionmatrixfinield(I13,p2,q2,p3,q3);
II4=idiffusionmatrixfinield(I14,p2,q2,p3,q3);
inverseF=[II1,II2;II3,II4];
%第二步逆置乱(解密)：行列搬移逆置乱512*512
InverseP=irowcolpositionscramble(P);
%第一步逆置乱(解密)：值逆置乱
IverseD=ivaluescramble512(InverseP,e,p1,q1);
%有限域上的图像逆过程。
IverseO=iorignal512(IverseD);
cc=C.x;
dd=D.x;
pp=P.x;
ff=F.x;
iff=inverseF.x;
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
% I=imread('lake.tiff');
% III=gf(I,8);
% q2=1021; p2=1019;  
% t=256;
% num=[1 2 3 4];
% I1=fenkuai(t,III,num(1));
% I2=fenkuai(t,III,num(2));
% I3=fenkuai(t,III,num(3));
% I4=fenkuai(t,III,num(4));
% I11=diffusionmatrixfinield(I1,p2,q2);
% I12=diffusionmatrixfinield(I2,p2,q2);
% I13=diffusionmatrixfinield(I3,p2,q2);
% I14=diffusionmatrixfinield(I4,p2,q2);
% O=[I11,I12;I13,I14];
% II1=idiffusionmatrixfinield(I11,p2,q2);
% II2=idiffusionmatrixfinield(I12,p2,q2);
% II3=idiffusionmatrixfinield(I13,p2,q2);
% II4=idiffusionmatrixfinield(I14,p2,q2);
% iO=[II1,II2;II3,II4];
% oo=O.x;
% ioo=iO.x;
% subplot(1,3,1),imshow(I);
% subplot(1,3,2),imshow(uint8(oo));
% subplot(1,3,3),imshow(uint8(ioo));
% for k=1:257
%          t1=III(1:256,k:k+255);
%          temp1=diffusionmatrixfinield(t1,p2,q2);
%          III(1:256,k:k+255)=temp1;
% %          t2=III(k:k+255,257:512);
% %          temp2=diffusionmatrixfinield(t2,p2,q2);
% %          III(k:k+255,257:512)=temp2;
% %          t3=III(257:512,513-k:258-k); 
% %           temp3=diffusionmatrixfinield(t3,p2,q2);
% %          III(257:512,513-k:258-k)=temp3;
% %          t4=III(513-k:258-k,1:256); 
% %           temp4=diffusionmatrixfinield(t4,p2,q2);
% %          III(513-k:258-k,1:256)=temp4;
% end
% o=III;

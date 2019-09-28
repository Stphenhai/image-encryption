clc;close all;
clear all;


I1=load('F:\最近\文章\正文1\结果\所有图片\数据\peper256FrDCT.mat');
%H10.940081V10.969458D10.937315
% H30.00409867V3 -0.00327179D3 0.00595403

 In1=I1.X;%original
%Eout=I1.E;
%Eout=uint8(I1.X);
%Eout=uint8(I1.Eout1);%RFrDCT
Eout=uint8(I1.Out);%FrDCT

%%%%%%%%%%%%%%%%%%%%%原图像三个方向
%H1 = corr3D(In1,'H')
%vpa(H1,6)
%V1 = corr3D(In1,'V')
%vpa(V1,6)
% D1=corr3D(In1,'D')  
%vpa(D1,6)

%%%%%%%%%%%%%%%%%%%%%%%55

%%%%%%%%%%%%%%%%%%%%%%加密图像

%H3 = corr3D(Eout,'H')
%vpa(H3,6)

%V3 = corr3D(Eout,'V')
%vpa(V3,6)

D3 = corr3D(Eout,'D')
%D3 = corr3D(In1,'D')
vpa(D3,6)

%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%原rfrdct
%  H31 = corr(E1,'H')
% vpa(H31,6)
% V31 = corr(E1,'V')
% vpa(V31,6)
% D31 = corr(E1,'D')
% vpa(D31,6)
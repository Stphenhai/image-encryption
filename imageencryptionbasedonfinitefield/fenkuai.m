% function [I1,I2,I3,I4]=fenkuai(I);
% height =size(I,1);
% width=size(I,2);
% region_size = 256;  %区域宽高大小  
% numRow = round(height/region_size);%图像在垂直方向能分成多少个大小为region_size  
% numCol = round(width/region_size);%图像在水平方向能分成多少个大小为region_size  
% % I=imresize(I,[numRow*region_size,numCol*region_size]);%重新生成新的图像，以防止temp下标越界
% t1 = (0:numRow-1)*region_size + 1;
% t2 = (1:numRow)*region_size;  
% t3 = (0:numCol-1)*region_size + 1; 
% t4 = (1:numCol)*region_size;
%% 子函数 分块函数，t为每块的边长，I为要分块的图像，num为返回第几大块
function fv=fenkuai(t,I,num)
[~,N]=size(I);
N=N/t;
x=floor(num/N)+1;      %第几大行
y=mod(num,N);           %第几大列
if y==0
    x=x-1;
    y=N;
end
fv=I(t*(x-1)+1:t*x,t*(y-1)+1:t*y);
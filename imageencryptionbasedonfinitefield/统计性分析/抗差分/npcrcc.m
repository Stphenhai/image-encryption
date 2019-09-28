function y=npcrcc(I1,I2)
[m,n]=size(I1);
y=sum(sum(I1~=I2))/(m*n)*100;

function y=uacicc(I1,I2)
I1=double(I1);
I2=double(I2);
[m,n]=size(I1);
y=sum(sum(abs(I1-I2)));
y=y/(m*n*255)*100;
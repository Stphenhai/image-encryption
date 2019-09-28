function F=mse2(imageX,imageY)
imageSize=size(imageX);
imageSize=imageSize(1);
sum=0;
for L=1:imageSize*imageSize
    sum=sum+((abs(imageX(L))-abs(imageY(L))))^2;
end;
F=sum/imageSize/imageSize;


function c=psnr(x,x1)
x=double(x);
x1=double(x1);
[M,N]=size(x);
[M1,N1]=size(x1);
if((M1~=M)||(N~=N1))
    disp('Error: two images are not of the same size');
    c=0;
end
e=abs(x-x1);
e=e.^2;
mse=sum(sum(e))/(M*N)
if mse==0
    c=inf;
else
    c=10*log10(255*255/mse);
end

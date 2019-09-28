function xg = corr(I,m)

[M,N] = size(I);

switch m
    case 'V'
for k=1:2000 
    i=fix(rand*(M-1));
    j=fix(rand*(N-1));
    x(k)=I(i+1,j+1);
    y(k)=I(i+2,j+1);
end
figure,
plot(x,y,'b.');
axis([0 250 0 250])
%  title('Vertical direction correlation of the encrypted image');
    case 'H'
      for k=1:2000
    i=fix(rand*(M-1));
    j=fix(rand*(N-1));
    x(k)=I(i+1,j+1);
    y(k)=I(i+1,j+2);
      end
figure,
plot(x,y,'b.');
axis([0 250 0 250])
% title('Horizontal direction correlation of the encrypted image');
    case 'D'
       for k=1:2000
    i=fix(rand*(M-1));
    j=fix(rand*(N-1));
    x(k)=I(i+1,j+1);
    y(k)=I(i+2,j+2);
       end
       figure,
plot(x,y,'b.');
axis([0 250 0 250])
% title('Diagonal direction correlation of the encrypted image');
end 

sum=0.0;
sum=double(sum);
for i=1:2000
    sum=sum+double(x(i));
end
ex=sum/2000;
sum=0.0;
sum=double(sum);
for i=1:2000
    sum=sum+double(y(i));
end
ey=sum/2000;
sum=0.0;
sum=double(sum);
for i=1:2000
    sum=sum+double(x(i))*double(x(i));
end
ex2=sum/2000;
sum=0.0;
sum=double(sum);
for i=1:2000
    sum=sum+double(y(i))*double(y(i));
end
ey2=sum/2000;
dx=ex2-ex*ex;
dy=ey2-ey*ey;
sum=0.0;
sum=double(sum);
for i=1:2000
    sum=sum+double(x(i))*double(y(i));
end
exy=sum/2000;
cov=exy-ex*ey;
dx=double(dx);
dy=double(dy);
xg=cov/(sqrt(dx)*sqrt(dy));
xg = vpa(xg,10);
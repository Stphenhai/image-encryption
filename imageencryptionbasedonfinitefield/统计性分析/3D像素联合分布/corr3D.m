function xg = corr3D(I,m)

[M,N] = size(I);
switch m
    case 'H'
for i=1:M
    for j=1:N-1
        a=I(i,j);b=I(i,j+1);
        X((i-1)*255+j,1)=a;
        X((i-1)*255+j,2)=b;
    end
end
    case 'V'
   I=I';
for i=1:M
    for j=1:N-1
        a=I(i,j);b=I(i,j+1);
        X((i-1)*255+j,1)=a;
        X((i-1)*255+j,2)=b;
    end
end

    case 'D'
for i=2:M
    for j=1:N-1
        a=I(i,j);b=I(i-1,j+1);
        X((i-2)*255+j,1)=a;
        X((i-2)*255+j,2)=b;
    end
end
end
 %%%%%%%%%%%%%%%%%%%%%%%55计算相领像素组的个数
 for i=1:256
    for j=1:256
        a=i-1;b=j-1;
        x=find(X(:,1)==a & X(:,2)==b);
        num=length(x);
    Z(i,j)=num;
    end 
    
 end
[XP,YP]=meshgrid(0:255);
meshc(XP,YP,Z)
axis([0 250 0 250 0 8]);
x1=xlabel('The valuer of pixels')    
x2=ylabel('The valuer of pixels')       
x3=zlabel('The number of pixels')
set(x1,'Rotation',15) 
set(x2,'Rotation',-25)
figure
numx=length(X);
X=double(X);
Xmean=mean(X(:,1));
Ymean=mean(X(:,2));

add1=0;
add2=0;
add3=0;
for i=1:numx
    add1=double((X(i,1)-Xmean)*(X(i,2)-Ymean)+add1);
    add2=double((X(i,1)-Xmean)^2+add2);
    add3=double((X(i,2)-Ymean)^2+add3);
end
xg=add1/sqrt((add2*add3));
% xg=vpa(xg,6);    

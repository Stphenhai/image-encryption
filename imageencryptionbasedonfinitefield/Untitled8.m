% function value=positionscramble(p,)
clear,clc;
y=gf(0:511,9);
m0=zeros(1,512);
for i=0:511
    m0(i+1)=i;
end  
w0=y(3).^double(m0);

%  w0(512)=0;
ww0=w0.x;
www=sort(ww0);
e=y(3);
p1=26861;
q1=42787;
p3=332851;
q3=1048507;
% w1=((w0)+(w0).^3+(w0).^33);
% w1=((w0+e)+(w0+e).^3+(w0+e).^33).^(p/q);
wd1=(((w0+e)+(w0+e).^3+(w0+e).^33));
for i=1:512
    if(wd1(i)==0)
        wd1(i)=1;
        k=i;
    end    
end  
w1=((wd1).^(p3)).^(-q3+511);
w1(2)=0;
w11=w1.x;
w111=sort(w11);
e1=y(3)^129;
% w2=((w0)+(w0).^171+(w0).^341);
w2=(((w0+e1)+(w0+e1).^171+(w0+e1).^341).^(p1/q1));
w22=w2.x;
w222=sort(w22);
return;

xx = gf(0:255,8);
m00=zeros(1,256);
for i=0:255
    m00(i+1)=i;
end  
w00=xx(3).^double(m00);
w00(256)=0;
e1=xx(3)^127;
% w20=(((w00+e1).^59+(w00+e1).^209+(w00+e1).^254).^(q1)).^(-p1+255);
w20=((w00+e1).^59+(w00+e1).^209+(w00+e1).^254);
for i=1:256
    if(w20(i)==0)
        w20(i)=1;
        k=i;
    end    
end  
fw20=((w20).^q3).^(-p3+255);
fw20(128)=0;
% w0(256)=0;
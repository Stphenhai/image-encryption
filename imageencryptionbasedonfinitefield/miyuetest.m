clear;clc;
xx = gf(0:255,8); % ����1*256һά������
m0=zeros(1,256);
for i=0:255
    m0(i+1)=i;
end  
w0=xx(3).^double(m0);
w0(256)=0;


%���û���Կ
e1=xx(3)^11;
% ԭʼ��Կ
p1=191;   
q1=193;
p11=1025939;
% p1 = 181;
% q1=197;
%���û�����ʽ
w1=(((w0+e1).^59+(w0+e1).^209+(w0+e1).^254).^(q1));
for i=1:256
    if(w1(i)==0)
        w1(i)=1;
        k=i;
    end   
end    
w2=(w1).^(-p11+255);
w2(k)=0;
w22=w2.x;
w222=sort(w22);
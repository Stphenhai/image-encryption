function ivalue=ivaluescramble512(C,e,p1,q1)
x = gf(0:255,8);
y = gf(0:255,8);
list = gf(0:255,8);
for i = 0:255
    y(i+1) = pp(x(i+1), e, q1, p1);
end
for i = 0:255
    list(i+1) = x(find(y==i));
end 
ivalue=C;
%Í¼Ïñ512*512
for j=1:512
ivalue(j,:)=ipp(list,C(j,:));
end

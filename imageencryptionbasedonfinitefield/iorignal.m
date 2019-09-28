function ori=iorignal(I)
% clear;clc;
x=gf(0:255,8);
y = gf(0:255,8);
list = gf(0:255,8);
list2= gf(0:255,8);
% y=gf(0:255,8);
% y=y*y
for i=1:255
y(i)=x(3)^(i-1);
end
y(256)=0;
% yy=y.x;
for i=0:255
list(i+1)=x(find(y==i));
end
list(257)=0;
for i=1:256
list2(i)=list(i+1);
end
% I=imread('lena.bmp');
I1=I.x;
% C=x(3).^I1;
ori=x'*x;
% cc=C.x;
for i=1:256
    for j=1:256
          if (I1(i,j)==0)
              ori(i,j)=1;
        else     
           ori(i,j)=list2(I1(i,j));
        end  
    end
end    
% for i=1:256
%     y(i,:)=x(3).^l(i,:);
% end
% z=x(3).^y;




% x=gf(0:255,8);
% y = gf(0:255,8);
% list = gf(0:255,8);
% list2= gf(0:255,8);
% % y=gf(0:255,8);
% % y=y*y
% for i=1:255
% y(i)=x(3)^(i-1);
% end
% y(256)=0;
% % yy=y.x;
% for i=0:255
% list(i+1)=x(find(y==i));
% end
% list(257)=0;
% for i=1:256
% list2(i)=list(i+1);
% end
% % I=imread('lena.bmp');
% % I1=I.x;
% % % C=x(3).^I1;
% ori=x'*x;
% % % cc=C.x;
% for i=1:256
%     for j=1:256
%         if (I1(i,j)==0)
%               ori(i,j)=1;
%         else     
%            ori(i,j)=list2(I1(i,j));
%         end  
%     end
% end    
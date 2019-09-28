function outImage=junyunfenkuai(I,k)
k=4;
[m,n]=size(I);
height=256;
width=256;
cell
outImage=zeros(height,width);
for i=1:m/2
    for j=1:n/2
          outImage=I(i+k,j+k);
    end   
end    


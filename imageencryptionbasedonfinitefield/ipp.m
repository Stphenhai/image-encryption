%ipp.m to calculate inverse f[(x+e)^59 + (x+e)^209 + (x+e)^254]^alpha, alpha = q1/p1
% (255,q1) = 1, (255, p1) = 1, (p1,q1) = 1, 1<p1,q1<2^10, 
function x = ipp(list, y)
yy=y.x;
x = list(yy+1);
% function x = ipp(list, y,z)
% yy = z(y+1);
% zz=list(yy+1);

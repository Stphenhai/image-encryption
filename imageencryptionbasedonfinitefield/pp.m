%pp.m to calculate f[(x+e)^59 + (x+e)^209 + (x+e)^254]^alpha, alpha = q1/p1
% (255,q1) = 1, (255, p1) = 1, (p1,q1) = 1, 1<p1,q1<2^10, 
function y = pp(x, e, q1, p1)
y1 = (x + e).^59;
y2 = (x + e).^209;
y3 = (x+e).^254;
% y=(y1+y2+y3).^(p1/q1);
y = ((y1+y2+y3).^q1).^(-p1+255);

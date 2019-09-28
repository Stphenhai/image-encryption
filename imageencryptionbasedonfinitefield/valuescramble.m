function value=valuescramble(C,e,p1,q1)
%置换多项式 ，变换第一步，值置乱。
value=(((C+e).^59+(C+e).^209+(C+e).^254).^(q1)).^(-p1+255);
% value=((C+e).^59+(C+e).^209+(C+e).^254).^(q1/p1);
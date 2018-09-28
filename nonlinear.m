clc;
clear all;

syms x;

%f=(x^3)+(4*x^2)-7*x+6;
f=(x^3)+(4*x^2)+4*x;
t=diff(f,x);
t2=diff(t,x);

c = coeffs(t)
d=[c(3) c(2) c(1)];
ck=roots(d);

s=double(ck)
disp(s(1))
if subs(t2, x, s(1))<0


disp('yerel maksimum')
else
    disp('yerel minimum')
end
disp(s(2))

if subs(t2, x, s(2))<0


disp('yerel maksimum')
else
    disp('yerel minimum')
end
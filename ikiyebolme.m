close all;
clear all;
syms x;

f=(x^3)+(4*x^2)-7*x+6;

xa=0;
xb=2;

xk=3;

t=diff(f,x);
k=0;
while k<10;
xk=xa+(xb-xa)/2
    if subs(t,x,xk)*subs(t,x,xa)>0
        xa= xk;
        a=double(xa)
    else
    xb=xk; 
    b=double(xb)
    end
esik=double(subs(t,x,xk)>0)
k=k+1;
end

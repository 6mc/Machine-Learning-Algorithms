clear all
close all
clc
xa=0.1;
xb=2.2;
N=ceil(log2(abs(xb-xa)/0.0000001));

k=0;
disp([k,xa,xb])
dfa=exp(-xa)-xa*exp(-xa)-sin(xa);
dfb=exp(-xb)-xb*exp(-xb)-sin(xb);
if dfa*dfb<0
    for k=1:N 
        xk=xa+(xb-xa)/2;
        dfa=exp(-xa)-xa*exp(-xa)-sin(xa);
        dfb=exp(-xb)-xb*exp(-xb)-sin(xb);
        dfk=exp(-xk)-xk*exp(-xk)-sin(xk);
        if dfk*dfa>0
            xa=xk;
        else
            xb=xk;
        end
        disp([k,xa,xb])
    end
end
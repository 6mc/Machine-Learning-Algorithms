clear all
close all
clc
xa=0.1;
xb=2.2;
k=0;
kosul=1;
disp([k,xa,xb])
dfa=exp(-xa)-xa*exp(-xa)-sin(xa);%bu fonksiyonu farklý dosya olarakta yaabiliriz
dfb=exp(-xb)-xb*exp(-xb)-sin(xb);
if dfa*dfb<0
    while kosul
        k=k+1;
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
        if abs(dfk)<0.00001;kosul=0; end
    end
end

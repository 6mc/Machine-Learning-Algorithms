clear all
close all
clc
x=0.1;
for k=1:10
    f=x*exp(-x)+cos(x);
    df=exp(-x)-x*exp(-x)-sin(x);
    ddf=-exp(-x)-exp(-x)+x*exp(-x)-cos(x);
    DELTAf=-df/ddf;
    x=x+DELTAf;
    disp([k,x,df,f])
end

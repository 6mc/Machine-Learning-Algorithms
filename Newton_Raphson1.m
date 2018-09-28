clear all
close all
clc
x=2.1;
kosul=1;k=0;
while kosul
    k=k+1;
    f=x*exp(-x)+cos(x);
    df=exp(-x)-x*exp(-x)-sin(x);
    ddf=-exp(-x)-exp(-x)+x*exp(-x)-cos(x);
    DELTAf=-df/ddf;
    disp([k,x,df,f])
    x=x+DELTAf;
    if abs(df)<0.00001;kosul=0;end
end

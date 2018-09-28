clear all
close all
clc
x=1.5;
kosul=1;k=0;
while kosul
    k=k+1;
    f=(x-1)^2*(x-2)*(x-3);
    df=2*(x-1)*(x-2)*(x-3)+(x-1)^2*(2*x-5);
    ddf=2*(x-2)*(x-3)+2*(x-1)*(2*x-5)+ 2*(x-1)*(2*x-5)+2*(x-1)^2;
    DELTAf=-df/ddf;
    disp([k,x,f,df,ddf,DELTAf])
    x=x+DELTAf;
    if abs(df)<0.00001;kosul=0;end
end
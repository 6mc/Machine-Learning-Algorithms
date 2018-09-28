clear all
close all
clc
xalt=0;
xust=4;
DELTAx=1e-4;
TAU=0.38197;
epsilon=DELTAx/(xust-xalt);
N=ceil(-2.078*log(epsilon));%ceil degeri bir ust sayýya yuvarlamak için kullanýlýr
x1=xalt + TAU*(xust-xalt);
f1=GSfunc1(x1);
x2=xust - TAU*(xust-xalt);
f2=GSfunc1(x2);
for k=1:N
    if f2 < f1
        xalt=x1;
        x1=x2;f1=f2;
        x2=xust - TAU*(xust-xalt);
        f2=GSfunc1(x2);
    else
        xust=x2;
        x2=x1;f2=f1;
        x1=xalt + TAU*(xust-xalt);
        f1=GSfunc1(x1);  
    end
    disp([k,x1,x2,f1,f2])
end
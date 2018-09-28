close all;
clear all;
xalt=0;

xust=4;

xson=0.0001;

t=0.38197;

tolerans= xson/(xust-xalt);

N=-2.078*log(tolerans);

x1= xalt+t*(xust-xalt);
x2= xust-t*(xust-xalt);
syms x;

f=((x-1)^2)*(x-2)*(x-3);

f1= subs(f,x,x1);
f2= subs(f,x,x2);

k=-1;
while k<N
k=k+1
xbir=double(x1)
xiki=double(x2)
fbir=double(f1)
fiki=double(f2)

    if f2<f1
    xalt=x1;
    x1=x2;
    f1=f2;
    x2=xust-t*(xust-xalt);
    f2=subs(f,x,x2);
    else
        if f1<f2
        
            xust=x2;
            x2=x1;
            f2=f1;
            x1=xalt+t*(xust-xalt);
            f1=subs(f,x,x1);
            
            
        end 
        end

end



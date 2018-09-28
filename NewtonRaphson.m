clear all;
close all;


 val=3;
dk=0;

syms x;
f=((x-1)^2)*(x-2)*(x-3);

t=diff(f,x)
t2=diff(t,x)
k=-1;

while  k<5 
k=k+1
   esik =subs(t,x,val+dk);
    
    dk=(-1*subs(t,x,val))/subs(t2,x,val);
    
    
    
    xdegeri=    double(val)
val=val+dk;

delta=double(dk)

kontrol=double(esik);
end
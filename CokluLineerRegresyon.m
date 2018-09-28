clear all;
close all;

t=[-0.9 0.1 2.2 0.3
    3.7 0.2 3.5 -0.5
    2.1 -0.3 -1.9 2.9
    4.4 4.6 -3.4 -2.8
    0.2 3.6 -4.2 -1.9
    -0.7 -1.9 2.5 2.3];

y=[-0.4; -0.9; -2.5; 0.8; 3.1; -4.5];

N= size(t,1);

T= [ones(N,1),t];

Meleg= T'*T;

tavares=inv(Meleg);

x=tavares*(T')*(y);
loop=1;
k=0;

while loop~=0

    k=k+1;
    yhat=[ones(N,1),t]*x;
    e=y-yhat;
    f=e'*e;
    g=[-2*sum(e)
    -2*sum(T(:,1).*e)
    -2*sum(T(:,2).*e)
    -2*sum(T(:,3).*e)
    -2*sum(T(:,4).*e)];

p=-g;
s=0.007;
x=x+s*p;
disp([k,x',f])

if k >10000 
    loop=0;
end


end

    
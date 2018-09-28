clear all
close all
clc

x=[-4.5;-3.5];%baþlangýç deðeri
f=GSsd1(x);
loop=1;k=0;
while loop
    k=k+1;
    gradient=[2*(x(1)-1.5*x(2));-3*(x(1)-1.5*x(2))+2*(x(2)-2)];
    p=-gradient;
    [s]=GoldenSection2(x,p);
    x= x+s*p;
    f=GSsd1(x);
    disp([k,s,x(1),x(2),f]);
    if(k>500) | norm(gradient) < 1e-4; loop=0; end
end
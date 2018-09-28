close all
clear all
clc

t=[-4:0.8:4]';
x=rand(2,1)-0.5;
%y=0.6294*exp(0.8116*t)
 y=2.7229*exp(-1.1585*t);
y1=[11.3323;7.0686;4.4090;2.7502;1.7154;1.0700;0.6674;0.4163;0.2597;0.1620;0.1010];

plot(t,y,'bx')
hold on



yhat=x(1)*exp(x(2)*t);
e=y-yhat;
F=e'*e;
h=plot(t,yhat,'r-');
title(['F=',num2str(F)]) %nümerik ifadeyi karaktere çevirip baþlýk yazdýr
 
loop=1; sayac=0;
while loop
    sayac=sayac+1;
J=-[exp(x(2)*t),x(1)*t.*exp(x(2)*t)];
p=-2*J'*e;
s=0.000001; % s deðerini oynayarak hýz ayarýný ayarlarýz
x=x+s*p;
yhat=x(1)*exp(x(2)*t);
e=y-yhat;
F=e'*e;
delete(h)
h=plot(t,yhat,'r-');
title(['k:',num2str(sayac),'s:',num2str(s),'F=',num2str(F)]) %nümerik ifadeyi karaktere çevirip baþlýk yazdýr
pause(.1) % zamaný ayarlayabiriz
if sayac>100 | norm(p)<1e-6 loop=0; end
end


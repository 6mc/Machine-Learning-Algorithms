%TEMEL MODELLER
clear all
close all
clc

t=[-3:0.17:3]';
y=4.2+0.1*t+7.8*t.^2-1.7*t.^3;

noise = 0.0*randn(length(y),1); %buradaki katsayý gürültü katsayýsýdýr
y=y+noise;
n=4; %polinomun derecesiyle oynar

J=[];

for k=1:n
    J = [J, -t.^(k-1)]; %jakobian matrisini oluþturur ilk seferde k yerine 
%1 gelir ve t üzeri 0 olur ve -1 sütünu oluþturur.daha sonra 2 gelir t
%üzeri 1 olur t deðerleri yazýlýr ve J nin 2 sürünu oluþur bu þekilde k 
%kadar devam eder.
end

x=-inv(J'*J)*J'*y %kitapta 64.sayfadaki x^* formülü

yhat=-J*x;
e=y-yhat;
F=e'*e;


x=rand(n,1);
for k=1:200
    yhat= -J*x;
    e=y-yhat;
    F=e'*e;
    p=-2*J'*e;
    s=0.0001;
    x=x+s*p;
    disp(F)
end
plot(t,y,'b*')
hold on
plot(t,yhat,'r')
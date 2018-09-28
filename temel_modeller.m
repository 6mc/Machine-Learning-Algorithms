%TEMEL MODELLER
clear all
close all
clc

t=[-3:0.17:3]';
y=4.2+0.1*t+7.8*t.^2-1.7*t.^3;

n=6; %polinomun derecesiyle oynar

J=[];

for k=1:n
    J = [J, -t.^(k-1)] %jakobian matrisini olu�tururilk seferde k yerine 
%1 gelir ve t �zeri 0 olur ve -1 s�t�nu olu�turur.daha sonra 2 gelir t
%�zeri 1 olur t de�erleri yaz�l�r ve J nin 2 s�r�nu olu�ur bu �ekilde k 
%kadar devam eder.
end

x=-inv(J'*J)*J'*y; %kitapta 64.sayfadaki x^* form�l�

yhat=-J*x;
e=y-yhat;
F=e'*e

plot(t,y,'b*')
hold on
plot(t,yhat,'r')

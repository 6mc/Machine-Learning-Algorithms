%TEMEL MODELLER
clear all
close all
clc

t=[-4:0.8:4]';

%bu de�eri girersem de x de�erlerini elde ederim tercih
%y=1.1979+0.4397*t-0.3476*t.^2;


%bu de�eri girersem plinomu ve x de�erlerini elde ederim
%�rne�in run yapt�ktan sonra ��kan x de�erleri �u �ekilde yaz�l�r
% x(1)+x(2)*t(i)+x(3)*t(i)^2
y=[11.3323;7.0686;4.4090;2.7502;1.7154;1.0700;0.6674;0.4163;0.2597;0.1620;0.1010];


n=2; %polinomun derecesiyle oynar

J=[];

for k=1:n
    J = [J, -t.^(k-1)] %jakobian matrisini olu�tururilk seferde k yerine 
%1 gelir ve t �zeri 0 olur ve -1 s�t�nu olu�turur.daha sonra 2 gelir t
%�zeri 1 olur t de�erleri yaz�l�r ve J nin 2 s�r�nu olu�ur bu �ekilde k 
%kadar devam eder.
end

x=-inv(J'*J)*J'*y %kitapta 64.sayfadaki x^* form�l�

yhat=-J*x;
e=y-yhat;
F=e'*e

plot(t,y,'b*')
hold on
plot(t,yhat,'r')

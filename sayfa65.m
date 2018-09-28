%TEMEL MODELLER
clear all
close all
clc

t=[-4:0.8:4]';

%bu deðeri girersem de x deðerlerini elde ederim tercih
%y=1.1979+0.4397*t-0.3476*t.^2;


%bu deðeri girersem plinomu ve x deðerlerini elde ederim
%örneðin run yaptýktan sonra çýkan x deðerleri þu þekilde yazýlýr
% x(1)+x(2)*t(i)+x(3)*t(i)^2
y=[11.3323;7.0686;4.4090;2.7502;1.7154;1.0700;0.6674;0.4163;0.2597;0.1620;0.1010];


n=2; %polinomun derecesiyle oynar

J=[];

for k=1:n
    J = [J, -t.^(k-1)] %jakobian matrisini oluþtururilk seferde k yerine 
%1 gelir ve t üzeri 0 olur ve -1 sütünu oluþturur.daha sonra 2 gelir t
%üzeri 1 olur t deðerleri yazýlýr ve J nin 2 sürünu oluþur bu þekilde k 
%kadar devam eder.
end

x=-inv(J'*J)*J'*y %kitapta 64.sayfadaki x^* formülü

yhat=-J*x;
e=y-yhat;
F=e'*e

plot(t,y,'b*')
hold on
plot(t,yhat,'r')

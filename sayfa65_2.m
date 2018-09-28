%TEMEL MODELLER
clear all
close all
clc

t=[-2:0.2:2]';

%bu deðeri girersem de x deðerlerini elde ederim tercih
%y=1.1979+0.4397*t-0.3476*t.^2;

% ya ploinom giricem yada y deðeri giricem
%bu deðeri girersem plinomu ve x deðerlerini elde eferim
%örneðin run yaptýktan sonra çýkan x deðerleri þu þekilde yazýlýr
% x(1)+x(2)*t(i)+x(3)*t(i)^2
y=[-1.9499
    -1.4558
    -0.7719
    -0.5325
    -0.1693
    -0.2355
    -0.0295
    0.1154
    -0.0216
    0.1753
    0.2485
    -0.0652
    0.2044
    0.2604
    0.0669
    0.1113
    0.0886
    -0.1445
    -0.4356
    -0.4396
    -1.0387]
length(y)


n=5; %polinomun derecesiyle oynar

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

%RBF MODELLEME
clear all
close all
clc

t=[-3:0.17:3]';
y=4.2+0.1*t+7.8*t.^2-1.7*t.^3;

noise = 0.0*randn(length(y),1); %buradaki katsayý gürültü katsayýsýdýr
y=y+noise;
tmin=min(t);
tmax=max(t);

n=8; %polinomun derecesiyle oynar
N=size(t,1); %data sayýmýz

c(1)=tmin+(tmax-tmin)/(2*n);
for k=2:n
    c(k) =c(k-1)+(tmax-tmin)/(n);
    
end
sigma= (tmax-tmin)/(n);

J=[];
for i=1:N
for j=1:n
    J(i,j)= -exp(-(t(i)-c(j))^2/(sigma)^2); % sayfa 67 deki formül
end
end
x=-inv(J'*J)*J'*y %kitapta 64.sayfadaki x^* formülü

yhat=-J*x;
e=y-yhat;
F=e'*e;


x=rand(n,1);
for k=1:2000
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
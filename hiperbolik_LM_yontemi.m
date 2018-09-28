close all
clear all
clc

t=[-2.5:0.54:2.36]'; %adým aralýðý

y=sin(t)./t;

N=size(t,1);

plot(t,y,'bx')
hold on
S=10; %durum sayýsý

x=rand(3*S+1,1)-0.5;

for n=1:N
    yhat(n,1)=sum(x(2*S+1:3*S).*tanh(x(1:S).*t(n)+x(S+1:2*S)))+x(3*S+1);
    
end
e=y-yhat;
F=e'*e;
h=plot(t,yhat,'r-');
title(['F=',num2str(F)]) %nümerik ifadeyi karaktere çevirip baþlýk yazdýr

loop=1; sayac=0;  mu=1;
while loop
    sayac=sayac+1;
    J=[];
    
    for n=1:N
        for j=1:S
            J(n,j)=-x(j+2*S)*t(n)*[1-tanh(x(j)*t(n)+x(j+S))^2];
        end
        for j=S+1:2*S
            J(n,j)=-x(j+S)*1*[1-tanh(x(j-S)*t(n)+x(j))^2];
        end
        for j=2*S+1:3*S
            J(n,j)=-tanh(x(j-2*S)*t(n)+x(j-S));
        end
        for j=3*S+1:3*S+1
            
            J(n,j)=-1;
        end
    end

    
    
    loop2 =1;
    while loop2
        p=-inv(J'*J+mu*eye(3*S+1))*J'*e;
        z= x+p;
        for n=1:N
            yhatz(n,1)=sum(z(2*S+1:3*S).*tanh(z(1:S).*t(n)+z(S+1:2*S)))+z(3*S+1);
            
        end
        ez=y-yhatz;
        Fz=ez'*ez;
        if Fz<F
            x=z;
            mu=mu/10;
            loop2=0;
        else
            mu =mu*10;
        end
        if mu>1e+99; loop2=0; loop=0; end
           
        
    end
        
        
        for n=1:N
            yhat(n,1)=sum(x(2*S+1:3*S).*tanh(x(1:S).*t(n)+x(S+1:2*S)))+x(3*S+1);
            
        end
        e=y-yhat;
        F=e'*e;
        delete(h)
        h=plot(t,yhat,'r-');
        title(['k:',num2str(sayac),'mu:',num2str(log10(mu)),'F=',num2str(F)])  %nümerik ifadeyi karaktere çevirip baþlýk yazdýr
        pause(0.001)
        if sayac>10000 | norm(p)<1e-6 loop=0; end
end
    

close all;
clear all;
clc;

t=[1 -0.9 0.1 2.2 0.3
   1 3.7 0.2 3.5 -0.5
   1 2.1 -0.3 -1.9 2.9
   1 4.4 4.6 -3.4 -2.8
   1 0.2 3.6 -4.2 -1.9
   1 -0.7 -1.9 2.5 2.3];

y=[-0.4; -0.9; -2.5; 0.8; 3.1; -4.5];

     sonuc=linsolve(t,y)
     
     Resultado=inv(t'*t)*t'*y
     
     error=y-t*Resultado;
     k=1;
     toplam=0;
     while k<7
        toplam= toplam+error(k)*error(k);
         k=k+1;
     end
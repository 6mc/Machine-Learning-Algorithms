close all
clear all
clc

% P=[28.7 31.6
%     21.5 31.7
%     25.8 33.4
%     24.5 31.4
%     22.5 32.8
%     -0.1 37.0
%     6.3 40.6
%     -0.6 39.7
%     2.3 39.4
%     2.5 33.8
%     12.2 2.7
%     16.0 6.5
%     14.5 8.7
%     12.2 1.1
%     17.5 4.0]; %verilen t de�erlerini girdik
load P %hocan�n g�nderdi�i p dizisi s�navda kullan�lacak
N=size(P,1);

for K=1:3 %ka� k�meye ay�rmak 15 k�meye ay�rd�k mesela

    close all
    plot(P(:,1),P(:,2),'b*')
hold on

%merkezleri bulmak i�in
Centers = P(1:K,:); %1den K ya kadar demek ,t�m s�t�nlar demek
h=plot(Centers(:,1),Centers(:,2),'ro')

loop=1;
sayac=0;

while loop
    sayac = sayac +1;
%k�me atama a�amas�
for n=1:N
    data=P(n,:);
    for k=1:K
        merkez = Centers(k,:);
        %�imdi merkezle data aras�ndaki uzakl��� bulal�m
        uzaklik(k)=sqrt((merkez-data)*(merkez-data)');
    end
    [value,index]=min(uzaklik);
    D(n)=value;
    I(n)=index;
end
PrevCenters=Centers; %bir �nceki merkeze atad�m sakland�m
%merkez g�ncelleme a�amas�
for k=1:K
    index=find(I==k);
    if length(index)==1
        Centers(k,:)=P(index,:);
    else   
   Centers(k,:) = mean(P(index,:));
    end
end
 delete(h);
 h=plot(Centers(:,1),Centers(:,2),'ro')
 pause(.1)
disp([Centers])

if [sayac>=20] | [norm(Centers-PrevCenters)<1e-3];
    loop=0;
end
end

for n=1:N
    data=P(n,:);
    for k=1:K
        merkez = Centers(k,:);
        %�imdi merkezle data aras�ndaki uzakl��� bulal�m
        uzaklik(k)=sqrt((merkez-data)*(merkez-data)');
    end
    [value,index]=min(uzaklik);
    D(n)=value;
end
ORTALAMA_UZAKLIKLAR(K)=mean(D)
end

figure;
plot(ORTALAMA_UZAKLIKLAR,'-o')
%datalar� plot edelim
% en son yap�lm�� hali i�in alttakileri uncommed et

% plot(P(:,1),P(:,2),'b*')
% hold on
% plot(Centers(:,1),Centers(:,2),'ro')
% grid

%A�IKLAMA
% k=1 oldu�unda tam ortada kalacakt�r uzakl�k bu 
% uzakl�klar�n ortalamas�da y�ksek ��kacakt�r
%k de�eri artt�k�a ortalama uzakl�k azalacakt�r
% Belii bir K de�erinden sonra iyile�me g�remeyiz.
% bunun i�in iyi g�rd���m�z k de�erinde sabitleme yapmal�y�z.

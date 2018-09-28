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
%     17.5 4.0]; %verilen t değerlerini girdik
load P %hocanın gönderdiği p dizisi sınavda kullanılacak
N=size(P,1);

for K=1:3 %kaç kümeye ayırmak 15 kümeye ayırdık mesela

    close all
    plot(P(:,1),P(:,2),'b*')
hold on

%merkezleri bulmak için
Centers = P(1:K,:); %1den K ya kadar demek ,tüm sütünlar demek
h=plot(Centers(:,1),Centers(:,2),'ro')

loop=1;
sayac=0;

while loop
    sayac = sayac +1;
%küme atama aşaması
for n=1:N
    data=P(n,:);
    for k=1:K
        merkez = Centers(k,:);
        %şimdi merkezle data arasındaki uzaklığı bulalım
        uzaklik(k)=sqrt((merkez-data)*(merkez-data)');
    end
    [value,index]=min(uzaklik);
    D(n)=value;
    I(n)=index;
end
PrevCenters=Centers; %bir önceki merkeze atadım saklandım
%merkez güncelleme aşaması
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
        %şimdi merkezle data arasındaki uzaklığı bulalım
        uzaklik(k)=sqrt((merkez-data)*(merkez-data)');
    end
    [value,index]=min(uzaklik);
    D(n)=value;
end
ORTALAMA_UZAKLIKLAR(K)=mean(D)
end

figure;
plot(ORTALAMA_UZAKLIKLAR,'-o')
%dataları plot edelim
% en son yapılmış hali için alttakileri uncommed et

% plot(P(:,1),P(:,2),'b*')
% hold on
% plot(Centers(:,1),Centers(:,2),'ro')
% grid

%AÇIKLAMA
% k=1 olduğunda tam ortada kalacaktır uzaklık bu 
% uzaklıkların ortalamasıda yüksek çıkacaktır
%k değeri arttıkça ortalama uzaklık azalacaktır
% Belii bir K değerinden sonra iyileşme göremeyiz.
% bunun için iyi gördüğümüz k değerinde sabitleme yapmalıyız.

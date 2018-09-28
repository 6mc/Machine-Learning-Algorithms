clear all
close all
clc

load LogReg.mat
[N,R] = size(T);

T1min = floor(min(T(:,1)))*1.2;
T1max =  ceil(max(T(:,1)))*1.2;
T2min = floor(min(T(:,2)))*1.2;
T2max =  ceil(max(T(:,2)))*1.2;

h=plot(T(find(Y==+1),1),T(find(Y==+1),2),'bo');set(h,'markersize',5);set(h,'LineWidth',2);
hold on
h=plot(T(find(Y== 0),1),T(find(Y== 0),2),'rs');set(h,'markersize',5);set(h,'LineWidth',1);set(h,'MarkerFaceColor',[1 0 0]);

h=xlabel('t_{1}'); set(h,'FontName','Cambria'); set(h,'FontSize',10); %set(h,'FontAngle','Italic')
h=ylabel('t_{2}'); set(h,'FontName','Cambria'); set(h,'FontSize',10); %set(h,'FontAngle','Italic')
axis([T1min,T1max,T2min,T2max])
h=gca; set(h,'FontName','Cambria');set(h,'FontSize',10)
set(gcf,'color',[1 1 1])
set(gcf,'Position',[112   324   466   349])
grid

x = rand(3,1)-0.5;

t1 = T1min:(T1max-T1min)/99:T1max;
t2 = -[x(1)+t1*x(2)]./x(3);
hyperplane = plot(t1,t2,'k');

loop = 1; k = 0;
while loop
    k = k + 1;
    yhat = sigmoid([ones(N,1),T]*x);
    F = -sum(Y.*log(yhat)+(1-Y).*log(1-yhat));
    e = Y-yhat;
    g = [-sum(e)];
    for r=1:R
        [g]=[g; -T(:,r)'*e];
    end
    p = -g;
    s = 0.01;
    x = x + s*p;
    
    delete(hyperplane)
    t2 = -[x(1)+t1*x(2)]./x(3);
    hyperplane = plot(t1,t2,'k');
  
    disp([x', F])
    if norm(g)<1e-6 | k>1000000;loop=0;end
    pause(.1)
end



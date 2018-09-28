function [s] = GoldenSection2(x,p)
salt=0;
sust=1;
DELTAs=1e-6;
TAU=0.38197;
epsilon=DELTAs/(sust-salt);
N=ceil(-2.078*log(epsilon));%ceil degeri bir ust sayýya yuvarlamak için kullanýlýr
k=0;
s1=salt + TAU*(sust-salt);
f1=GSsd1(x+s1*p);
s2=sust - TAU*(sust-salt);
f2=GSsd1(x+s2*p);
for k=1:N
    if f2 < f1
        salt=s1;
        s1=s2;f1=f2;
        s2=sust - TAU*(sust-salt);
        f2=GSsd1(x+s2*p);
    else
        sust=s2;
        s2=s1;f2=f1;
        s1=salt + TAU*(sust-salt);
        f1=GSsd1(x+s1*p); 
    end
end
s=mean([s1,s2]);
end


clear all
close all
clc
x(1)=1;
x(2)=1;
for k=3:30
    x(k) = x(k-1)+ x(k-2);
    disp(x(k)/x(k-1))
end
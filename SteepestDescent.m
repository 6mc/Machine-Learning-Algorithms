clear
clc

nn = input('Enter no of independent variables: ');

for ii = 1:nn
    
    eval(sprintf('x%d = sym(''x%d'');', ii, ii))
    
end

f = input('Enter the function here in terms of x1 .... xn : ');
arg_names = symvar(f);
f = symfun(f, arg_names);

syms phi(t)

x0 = input('Enter the initial approximation: ');
change = 1;
xi = x0;

g = gradient(f, arg_names);
kk=1;
while change > eps
    
    gt = double(subs(g, arg_names, xi));
    
    if gt == 0
        break;
    end
    
    tt = xi - t*gt';
    phi = (subs(f, arg_names, tt));
    phi = symfun(phi, t);
    phi(t) = simplify(phi);
    phi_dash = diff(phi);
    ti = solve(phi_dash, t);
    ti = double(ti);
    im = imag(ti);
    re = real(ti);
    ri = im./re;
    ti(ri>1e-3) = [];
    ti = real(ti);
    temp = double(phi(ti));
    [~, te] = min(abs(temp));
    ti = ti(te);
    
    xt = xi;
    xi = xi - ti*gt'
    
    change = (xi-xt)*(xi-xt)'
    error(kk)=change;
    kk=kk+1
end
kk=1:kk-1;
plot(kk,error)
xlabel('Iteration')
ylabel('Error')
title('Plot showing Error convergence')
disp(strrep(['Solution is: [' num2str(xi, ' %0.2d') ']'], ',)', ')'))
%% Vast deelinterval
%(a)
f1 = @exp
f2 = @(x) 1./(1+(x.^2))
t1 = trapezium(f1,-1,1,100)
t2 = trapezium(f2,-5,5,100)
s1 = simpson(f1,-1,1,100)
s2 = simpson(f2,-5,5,100)
% de echte waarden zijn
e1 = exp(1) - exp(-1)
e2 = atan(5) - atan(-5)

for i = 1:1000
    texp(i) = abs(e1-trapezium(f1,-1,1,2*i));
    sexp(i) = abs(e1-simpson(f1,-1,1,2*i));
    tfun(i) = abs(e2-trapezium(f2,-5,5,2*i));
    sfun(i) = abs(e2-simpson(f2,-5,5,2*i));
    hexp(i) = 1/i;
    hfun(i) = 5/i;
end
figure(1)
semilogx(hexp, texp, 'b')
hold on
semilogx(hexp, sexp,'r')
semilogx(hexp, hexp,'g')
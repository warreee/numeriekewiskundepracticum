%% Vast deelinterval
%(a)
f1 = @exp;
f2 = @(x) 1./(1+(x.^2));
t1 = trapezium(f1,-1,1,100);
t2 = trapezium(f2,-5,5,100);
s1 = simpson(f1,-1,1,100);
s2 = simpson(f2,-5,5,100);
% de echte waarden zijn
e1 = exp(1) - exp(-1);
e2 = e
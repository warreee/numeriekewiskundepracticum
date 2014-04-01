%% Vast deelinterval
f1 = @exp;
f2 = @(x) 1./(1+(x.^2));
t1 = trapezium(f1,-1,1,100);
t2 = trapezium(f2,-5,5,100);
s1 = simpson(f1,-1,1,100);
s2 = simpson(f2,-5,5,100);
% de echte waarden zijn
e1 = exp(1) - exp(-1);
e2 = atan(5) - atan(-5);

for i = 1:100
    texp(i) = abs(e1-trapezium(f1,-1,1,2*i));
    sexp(i) = abs(e1-simpson(f1,-1,1,2*i));
    tfun(i) = abs(e2-trapezium(f2,-5,5,2*i));
    sfun(i) = abs(e2-simpson(f2,-5,5,2*i));
    hexp(i) = 1/i;
    hfun(i) = 5/i;
end
axis([0,1,0,1])
loglog(hexp, texp, 'b')
hold on
loglog(hexp, sexp,'r')
loglog(hexp, (hexp).^4,'g')
loglog(hexp, (hexp).^2,'y')
%% Adaptieve routine
%a
f1 = @exp;
f2 = @(x) 1./(1+(x.^2));
ta1 = trapezium_adaptief(f1,-1,1,10^-8)
sa1 = simpson_adaptief(f1,-1,1,10^-8)
ta2 = trapezium_adaptief(f2,-5,5,10^-8)
sa2 = simpson_adaptief(f2,-5,5,10^-8)
e1;
e2;
%b
%echte waarde is 1
format long
f3 = @ (x) sin(2*pi*x).^2;
ta3 = trapezium_adaptief(f3,-1,1,10^-8)
sa3 = simpson_adaptief(f3,-1,1,10^-8)
Q = quad(f3,-1,1,10^-8)
%c
%echte waarde is 2
f4 = @ (x) 1./sqrt(x);
ta3 = trapezium_adaptief(f4,0,1,10^-8)
sa3 = simpson_adaptief(f4,0,1,10^-8)
Q = quad(f4,0,1,10^-8)
% quad gebruikt een stopcriterium als het aantal recursies te veel wordt.
% uitvoeringstijd
f2 = @(x) 1./(1+(x.^2));
Reps = 10;
averagetime1 = 0;
averagetime2 = 0;
tic;
for i = 1:Reps
    ta2 = trapezium_adaptief(f2,-5,5,10^-8);
end
averagetime1 = toc/Reps
tic;
for i = 1:Reps
    sa2 = simpson_adaptief(f2,-5,5,10^-8);
end
averagetime2 = toc/Reps
for i=1:10
    Reps = 10;
    averagesimpson(i) = 0;
    tic;
    for j = 1:Reps
    ta2 = simpson_adaptief(f2,-5,5,10^-i);
    end
    averagesimpson(i) = toc/Reps;
end
averagesimpson;
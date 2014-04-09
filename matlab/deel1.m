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
e2 = atan(5) - atan(-5);

for i = 1:100
    % Te plotten vectoren voor functie 1
    texp(i) = abs(e1-trapezium(f1,-1,1,2*i));
    sexp(i) = abs(e1-simpson(f1,-1,1,2*i));
    % We geen 1/i mee omdat we als n al 2*i meegeven want 1-(-1)/2n = 1/n
    hexp(i) = 1/i;
    % Te plotten vectoren voor functie 2
    tfun(i) = abs(e2-trapezium(f2,-5,5,2*i));
    sfun(i) = abs(e2-simpson(f2,-5,5,2*i));
    hfun(i) = 5/i;
end
axis([0,1,0,1])
loglog(hexp, texp, 'b')
hold on
loglog(hexp, sexp,'r')
%loglog(hexp, (hexp).^4,'r--')
%loglog(hexp, (hexp).^2,'b--')
xlabel('Breedte van het interval: h')
ylabel('Absolute waarde van de integratiefout')

axis([0,5,0,5])
semilogy(hfun, tfun, 'b')
hold on
plot(hfun, sfun,'r')
xlabel('Breedte van het interval: h')
ylabel('Absolute waarde van de integratiefout')
%plot(hfun, (hfun).^2,'b--')
%plot(hfun, (hfun).^4,'r--')

%Door de loglog-plot te gebruiken worden de functies gelineariseerd.
%(b)
% De fout gedraagt zich voor de trapeziumregel als O(h^2) en voor de regel
% van Simpson als O(h^4). (Gedrag nog verklaren via handboek.)
%% Adaptieve routine
%(a)
f1 = @exp;
f2 = @(x) 1./(1+(x.^2));
ta1 = trapezium_adaptief(f1,-1,1,10^-8);
sa1 = simpson_adaptief(f1,-1,1,10^-8);
ta2 = trapezium_adaptief(f2,-5,5,10^-8);
sa2 = simpson_adaptief(f2,-5,5,10^-8);
%(b) Dit stuk moeten we nog deftig afmaken.
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
%% uitvoeringstijd
% dit stuk gaat heel traag als je het uitvoert dus waarschijnlijk ergens
% een fout.
f2 = @(x) 1./(1+(x.^2));
Reps = 10;
averagetime1 = 0;
averagetime2 = 0;
averagetime3 = 0;
tic;
for i = 1:Reps
    t = trapezium_adaptief(f2,-5,5,10^-8);
end
averagetime1 = toc/Reps
tic;
for i = 1:Reps
    s = simpson_adaptief(f2,-5,5,10^-8);
end
averagetime2 = toc/Reps
tic;
for i = 1:Reps
    q = quad(f2,-5,5,10^-8);
end
averagetime3 = toc/Reps
%(d)
for i=1:10
    x(i) = 10^-i;
    Reps = 10;
    averagetrapezium(i) = 0;
    tic;
    for j = 1:Reps
    ta = trapezium_adaptief(f2,-5,5,10^-i);
    end
    averagetrapezium(i) = toc/Reps;
end
averagetrapezium
for i=1:10
    Reps = 10;
    averagesimpson(i) = 0;
    tic;
    for j = 1:Reps
    sa = simpson_adaptief(f2,-5,5,10^-i);
    end
    averagesimpson(i) = toc/Reps;
end
averagesimpson
for i=1:10
    Reps = 10;
    averagequad(i) = 0;
    tic;
    for j = 1:Reps
    qa = quad(f2,-5,5,10^-i);
    end
    averagequad(i) = toc/Reps;
end
averagequad
loglog(x,averagetrapezium, 'b')
hold on
loglog(x,averagesimpson, 'r')
loglog(x,averagequad, 'y')
%(e) en (f) moeten nog gebeuren
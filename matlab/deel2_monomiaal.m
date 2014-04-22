%% (c)
[A,b] = stelsel_monomiaal(@exp,20)
for i = 1:20
    M = horzcat(A(1:i,1:i),(b(1:i))');
    [Q,R] = qr(M);
    a = asubst(R);
    %g = poly2sym(a);
    %h = @(x) (exp(x)-g(x)).^2;
   % int = @(x) quad(exp(x),-1,1,10^-8)
    %e(i) = sqrt(int);
    x = linspace(-1,1,10);
    evalfout(@exp,a,x)
end

%% (d)
x = 1:20;
%axis manual
axis([0,20,10^-15,1])
semilogy(x,e)
xlabel('de graad: n')
ylabel('de fout op g als benadering van f: e')
%% (f)
x = 1:20;
%axis manual
axis([0,20,10^-15,1])
semilogy(x,e)
hold on
xlabel('de graad: n')
ylabel('de fout op g als benadering van f: e')
semilogy(x,6.*(8.^(-x)),'r')
%% (g)
[Aster,bster] = stelsel_monomiaal_exp(20);
aster = zeros(20,20);
for i = 1:20
    M = horzcat(Aster(1:i,1:i),bster(1:i));
    [Q,R] = qr(M);
    x = asubst(R);
    n = length(x);
    aster(1:n,i) = x;
end
[A,b] = stelsel_monomiaal(@exp,20);
a = zeros(20,20);
for i = 1:20
    M = horzcat(A(1:i,1:i),(b(1:i))');
    [Q,R] = qr(M);
    x = asubst(R);
    n = length(x);
    a(1:n,i) = x;
end
delta_a = zeros(20,1);
delta_b = zeros(20,1);
delta_A = zeros(20,1);
for i = 1:20
    delta_a(i,1) = norm(a(:,i)-aster(:,i),2)/norm(aster(:,i),2);
    delta_b(i,1) = norm(b(1:i)-(bster(1:i))',2)/norm(bster(1:i),2);
    delta_A(i,1) = norm(A(1:i,1:i)-Aster(1:i,1:i),2)/norm(Aster(1:i,1:i),2);
end
%% (h)
x = 1:20;
y = ones(20,1);
semilogy(x,delta_b)
hold on
xlabel('De graad: n')
ylabel('Perturbaties')
semilogy(x,delta_A,'r')
semilogy(x,10^-8.*y,'g')
%% (i)
x = 1:20;
y = ones(20,1);
c = ones(20,1);
c(i,1) = cond(A(1:i,1:i));
semilogy(x,delta_b)
hold on
xlabel('De graad: n')
ylabel('Perturbaties')
semilogy(x,delta_A,'r')
semilogy(x,delta_a,'y')
semilogy(x,10^-8.*c,'g')
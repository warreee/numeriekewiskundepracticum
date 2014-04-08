%% (c)
[A,b] = stelsel_monomiaal(@exp,20)
for i = 1:20
    M = horzcat(A(1:i,1:i),(b(1:i))')
    [Q,R] = qr(M);
    a = asubst(R);
    g = poly2sym(a);
    h = @(x) (exp(x)-g(x)).^2;
    int = quad(h,-1,1,10^-8);
    e(i) = sqrt(int);
end
%% (d)
x = 1:20;
%axis manual
axis([0,20,10^-15,1])
semilogy(x,e)
%% (f)
x = 1:20;
%axis manual
axis([0,20,10^-15,1])
semilogy(x,e)
hold on
semilogy(x,6.*(8.^(-x)),'r')
%% (g)
[A2,b2] = stelsel_monomiaal_exp(20);
a2 = zeros(20,20);
for i = 1:20
    M = horzcat(A2(1:i,1:i),b2(1:i));
    [Q,R] = qr(M);
    x = asubst(R);
    n = length(x);
    a2(1:n,i) = x;
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
    delta_a(i,1) = norm(a(:,i)-a2(:,i),2)/norm(a2(:,i),2);
    delta_b(i,1) = norm(b(1:i)-(b2(1:i))',2)/norm(b2(1:i),2);
    delta_A(i,1) = norm(A(1:i,1:i)-A2(1:i,1:i),2)/norm(A2(1:i,1:i),2);
end
%% (h)
x = 1:20;
y = ones(20,1);
semilogy(x,delta_b)
hold on
semilogy(x,delta_A,'r')
semilogy(x,10^-8.*y,'g')
%% (i)
x = 1:20;
y = ones(20,1);
c = ones(20,1);
c(i,1) = cond(A(1:i,1:i));
semilogy(x,delta_b)
hold on
semilogy(x,delta_A,'r')
semilogy(x,delta_a,'y')
semilogy(x,10^-8.*c,'g')
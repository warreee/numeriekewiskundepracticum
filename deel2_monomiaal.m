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
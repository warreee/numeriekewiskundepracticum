function [ A,b ] = stelsel_monomiaal( f,n )
for i = 1:n
    %h(i) = @(x) x.^(i-1);
    %c(i) = @(x) f(x)*h(i)(x);
    fh = @(x) f(x).*x.^(i-1);
    b(i) = quad(fh,-1,1,10^-8);
    for j = 1:n
        hh = @(x) (x.^(i-1)).*(x.^(j-1));
        %d(i,j) = @(x) (h(i))(x).*(h(j))(x);
        A(i,j) = quad(hh,-1,1,10^-8);
    end
end
end


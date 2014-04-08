function [ A,b ] = stelsel_monomiaal( f,n )
for i = 1:n
    fh = @(x) f(x).*x.^(i-1);
    b(i) = quad(fh,-1,1,10^-8);
    for j = 1:n
        hh = @(x) (x.^(i-1)).*(x.^(j-1));
        A(i,j) = quad(hh,-1,1,10^-8);
    end
end
end


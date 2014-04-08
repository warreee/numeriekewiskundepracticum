function [e] = evalfout(f,a,x)
n = length(x);
m = length(a);
for j = 1:m
    b(j) = a(m-j+1);
end
for i = 1:n
    gx(i) = polyval(b,x(i));
    fx(i) = f(x(i));
end
e = fx - gx;
end


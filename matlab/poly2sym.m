function [ g ] = poly2sym( a )
n = length(a);
g = @(x) 0;
for i = 1:n
    g =  @(x) g(x) + a(i).*x.^(i-1);
end

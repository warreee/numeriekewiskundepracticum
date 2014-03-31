function [ I ] = simpson( f,a,b,n )
% de regel van simpson gebruikt een even aantal deelintervallen, dus n zou
% bij het ingeven al even moeten zijn.
x = linspace(a,b,n+1);
m = n/2;
h = (b-a)/n;
y = 0;
for i = 0:m-1
    y = y + f(x(2*i+1)) + 4*f(x(2*i+2)) + f(x(2*i+3));
end
I = (h*y)/3;
end


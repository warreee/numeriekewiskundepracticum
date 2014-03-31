function [I] = trapezium( f,a,b,n )
x = linspace(a,b,n+1);
% n+1 ipv n want n is het aantal deelintervallen dit wordt bepaald door
% n+1 punten
h = (b-a)/n;
y = 0;
for i = 1:n
    y = y + (f(x(i)) + f(x(i+1)))/2;
end
I = h*y;
end


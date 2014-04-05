fout = evalfout(@exp, 1:5, 1/pi)
f = @exp;
x = 1/pi;
n = length(x)
a = 1:5;
m = length(a);
for j = 1:m
    b(j) = a(m-j+1);
end
for i = 1:n
    gx(i) = polyval(b,x(i))
    fx(i) = f(x(i))
end
format long
e = fx - gx

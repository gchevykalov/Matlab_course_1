%420.505.554 - пределы     
syms x a b n

lims = [
  (x^4-3*x+2) / (x^5-4*x+3)   %1
  sin(sqrt(x+1))-sin(sqrt(x)) %inf 
  ((a-1+b^(1/n))/a)^n         %inf
];  

limit(lims(1), 1)
limit(lims(2), Inf)
limit(lims(3), Inf)

%862.909.1363 - производные
pretty(simplify(diff(cos(2*x)-2*sin(x))))
pretty(simplify(diff(3/2*(1-(1+x^2)^(1/3))^2+3*log(1+(1+x^2)^(1/3)))))
pretty(simplify(diff((asin(x)/x)^(1/x^2))))

%%%%%%%%%%%%%

p = [1.5 2.1 -5.87 -8.67];

a0 = solve(1.5 * x ^ 3 + 2.1 * x ^ 2 - 5.87 * x - 8.67);

a2 = roots(p);

a3(1) = fzero(@poly1, 2);
a3(2) = fzero(@poly1, -1.65);
a3(3) = fzero(@poly1, -1.75);

a1 = vpa(sort(vpa(a0,16)),16)
a2 = sort(a2)
a3 = sort(a3)

%%%%%%%%%%%%

syms x

y = atan(x) + 1/(3*x^3);

t2 = sym2poly(taylor(y, x, 1, 'Order', 2));
t3 = sym2poly(taylor(y, x, 1, 'Order', 3));
t4 = sym2poly(taylor(y, x, 1, 'Order', 4));
t5 = sym2poly(taylor(y, x, 1, 'Order', 5));

t = 0.5 : 0.001 : 1.5;

plot(t, polyval(t2, t),'r');
hold on;
grid on;
plot(t, polyval(t3, t),'b');
plot(t, polyval(t4, t),'c');
plot(t, polyval(t5, t),'m');
plot(t, atan(t) + 1./(3*t.^3),'k');
legend('t2','t3','t4','t5','function');
xlabel('x');
ylabel('y');


%%%%%%%%%%%%%%
syms x1 x2 x3;

A = round(rand(3) .* 18 - 9);
B = round(rand(3, 1) .* 18 - 9);
X = A \ B;

A1 = sym(A);
B1 = sym(B);
X1 = double(vpa(inv(A1) * B1, 10));

B2 = B1;
A2(:, 1) = A1(:, 1) .* x1;
A2(:, 2) = A1(:, 2) .* x2;
A2(:, 3) = A1(:, 3) .* x3;
for i = 1:3
    eqs(i) = (A2(i, 1) + A2(i, 2) + A2(i, 3) == B2(i));
end
eqs;
[xs(1), xs(2), xs(3)] = solve(eqs);

X2 = double(vpa(xs, 10))';

X
X1
X2

Err(:, 1) = abs(X - X1);
Err(:, 2) = abs(X - X2);
Err
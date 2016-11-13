syms x
f1 = sin(x);
f2 = exp(-1 ./ x.^2);
f3 = x + sqrt(x.^2) .* x.^15 + sqrt(x.^2) .* x.^4;

s1 = simplify(diff(f3, x))
s2 = simplify(diff(s1, x))
s3 = simplify(diff(s2, x))
s4 = simplify(diff(s3, x))
s5 = simplify(diff(s4, x))
s6 = simplify(diff(s5, x))
s7 = simplify(diff(s6, x))

%figure
%X1 = -pi : 0.01 : pi;
%t1 = taylor(f1, 'Order', 5, 'ExpansionPoint', 0);
%phi1 = abs(t1 - f1);
%plot(X1, double(subs(phi1, x, X1)));
%legend('sin');

% figure
% X2 = 0.01 : 0.01 : 6;
% t2 = taylor(f2, 'Order', 5, 'ExpansionPoint', 0.1);
% phi2 = abs(t2 - f2);
% plot(X2, double(subs(phi2, x, X2)));
% legend('exp(-1/x^2)');

figure
X3 = -3 : 0.01 : 3;
t3 = taylor(f3, 'Order', 16, 'ExpansionPoint', 0);
phi3 = abs(t3 - f3);
plot(X3, double(subs(phi3, x, X3)));
legend('x+|x|*x^{15}+|x|*x^4');

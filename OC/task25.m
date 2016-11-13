A = [0 2; -3 5]
B = [1; 3]
% X0:
X0 = [0; 2];
% X1:
A1 = [-1; -4]
A2 = [1; -2]
T0 = 0
T1 = log(sym(4))

syms t
syms t_lambda
D = det(A - t_lambda * eye(2))
res_lambda = solve(D)
x1 = null(A - res_lambda(1) * eye(2))
x2 = null(A - res_lambda(2) * eye(2))
c11 = sym(3)
c12 = -sym(3)
c21 = -sym(2)
c22 = sym(3)
x1 = [exp(2 * t); exp(2 * t)];
x2 = [sym(2) / sym(3) * exp(3 * t); exp(3 * t)];
expAt = [c11 * x1 + c12 * x2, c21 * x1 + c22 * x2]

syms t1
XX1 = subs(expAt, t, -t1) * X0
XX1 = subs(XX1, t1, T1)

XS1 = A1 - XX1
XS2 = A2 - XX1

syms tau
M_int = subs(expAt, t, T0 - tau) * B % Why "-"? Because of range changing

syms l1 l2
l = [l1; l2]

tmp = simple(transpose(M_int) * l)
rho_under_sqrt = int((M_int' * l) .^ 2, 'tau', T0, T1) % Rho(l | M_mu(t1))
rho_under_sqrt = simple(rho_under_sqrt)

hold on
axis manual
%plot([XS1(1) XS2(1)], [XS1(2) XS2(2)])
axis([-5 5 -5 5])

% Touching in XS1
syms lambda
L = rho_under_sqrt + lambda * (XS1' * l - 1)
dLdl1 = diff(L, l1)
dLdl2 = diff(L, l2)
dLdlambda = diff(L, lambda)
l_star_1 = solve(dLdl1, dLdl2, dLdlambda, 'l1', 'l2', 'lambda')
double(l_star_1.l1)
double(l_star_1.l2)
mu1 = sqrt(double(1 / subs(subs(rho_under_sqrt, l1, l_star_1.l1), l2, l_star_1.l2)))

% Touching in XS2
syms lambda
L = rho_under_sqrt + lambda * (XS2' * l - 1)
dLdl1 = diff(L, l1)
dLdl2 = diff(L, l2)
dLdlambda = diff(L, lambda)
l_star_2 = solve(dLdl1, dLdl2, dLdlambda, 'l1', 'l2', 'lambda')
double(l_star_2.l1)
double(l_star_2.l2)
mu2 = sqrt(double(1 / subs(subs(rho_under_sqrt, l1, l_star_2.l1), l2, l_star_2.l2)))

% Touching in the middle
XS1 - XS2
syms x1 x2
aaa = simple((x1 - XS1(1)) * (XS2(2) - XS1(2)) - (x2 - XS1(2)) * (XS2(1) - XS1(1)))
tres = solve(aaa, 'x1 + x2', 'x1', 'x2')
tres.x1
tres.x2
%plot([0 tres.x1], [0 tres.x2])


syms tl1 tl2
tl = [tl1; tl2]
orth = [tl1 tl2] * [XS1 - XS2]
nrm = [tl1 tl2] * tl - 1
l_star_3 = solve(orth, nrm, 'tl1', 'tl2')
double(l_star_3.tl1)
double(l_star_3.tl2)
res1 = l_star_3.tl1(2)
res2 = l_star_3.tl2(2)
% [res1; res2] doesn't instersects with [XS1; XS2] - FAIL, following code
% is not usable
% Look at vector, which is directed to the line XS1-XS2
syms lambda
L = rho_under_sqrt + lambda * ([res1; res2]' * l - 1)
dLdl1 = diff(L, l1)
dLdl2 = diff(L, l2)
dLdlambda = diff(L, lambda)
l_star_3 = solve(dLdl1, dLdl2, dLdlambda, 'l1', 'l2', 'lambda')
double(l_star_3.l1)
double(l_star_3.l2)
mu3 = double(1 / subs(subs(rho_under_sqrt, l1, l_star_3.l1), l2, l_star_3.l2))

mu = mu1
syms a
u = transpose(expAt * B) * l
u = subs(subs(u, l1, l_star_1.l1), l2, l_star_1.l2);
int(u, 't', T0, T1)
a = double(mu / double(int(u, 't', T0, T1)))
u = a * u
T = T0 : 0.01 : double(T1)

syms tau tt tau
X = subs(expAt, t, T0 - tt) * X0 + int(subs(expAt, t, T0 - tau) * B * subs(u, t, tau), 'tau', T0, tt)
xs = []
ys = []
for i = 1 : size(T, 2)
	temp = double(subs(X, tt, T(i)))
	xs = [xs; temp(1)]
	ys = [ys; temp(2)]
end
plot(xs, ys)
plot([A1(1) A2(1)], [A1(2) A2(2)], 'r')

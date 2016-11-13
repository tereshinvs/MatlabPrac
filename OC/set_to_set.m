A = [3 1; -13 -3]
B = [1; 3]
% X0:
A1 = [-1; 2]
A2 = [2; 1]
% X1:
X1 = [3; -4]
T0 = 0
T1 = sym(pi) / 8

syms t
syms t_lambda
D = det(A - t_lambda * eye(2))
res_lambda = solve(D)
x1 = null(A - res_lambda(1) * eye(2))
x2 = null(A - res_lambda(2) * eye(2))
x = x1 * (cos(2 * t) + i * sin(2 * t))
c11 = 0
c12 = -sym(13) / 2
c21 = 1
c22 = -sym(3) / 2
x1 = [-sym(3) / 13 * cos(2 * t) + sym(2) / 13 * sin(2 * t); cos(2 * t)];
x2 = [-sym(2) / 13 * cos(2 * t) + sym(-3) / 13 * sin(2 * t); sin(2 * t)];
expAt = [c11 * x1 + c12 * x2, c21 * x1 + c22 * x2]

syms t1
XX1 = subs(expAt, t, -t1) * X1
XX1 = subs(XX1, t1, T1)

XS1 = A1 - XX1
XS2 = A2 - XX1

syms tau
M_int = -subs(expAt, t, T0 - tau) * B % Why "-"? Because of range changing

syms l1 l2
l = [l1; l2]
rho_under_sqrt = int((M_int' * l) .^ 2, 'tau', T0, T1) % Rho(l | M_mu(t1))
rho_under_sqrt = simple(rho_under_sqrt)

% Touching in XS1
syms lambda
L = rho_under_sqrt + lambda * (XS1' * l - 1)
dLdl1 = diff(L, l1)
dLdl2 = diff(L, l2)
dLdlambda = diff(L, lambda)
l_star_1 = solve(dLdl1, dLdl2, dLdlambda, 'l1', 'l2', 'lambda')
double(l_star_1.l1)
double(l_star_1.l2)
mu1 = double(1 / subs(subs(rho_under_sqrt, l1, l_star_1.l1), l2, l_star_1.l2))

% Touching in XS2
syms lambda
L = rho_under_sqrt + lambda * (XS2' * l - 1)
dLdl1 = diff(L, l1)
dLdl2 = diff(L, l2)
dLdlambda = diff(L, lambda)
l_star_2 = solve(dLdl1, dLdl2, dLdlambda, 'l1', 'l2', 'lambda')
double(l_star_2.l1)
double(l_star_2.l2)
mu2 = double(1 / subs(subs(rho_under_sqrt, l1, l_star_2.l1), l2, l_star_2.l2))

% Touching in the middle
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

mu = mu2
syms a
u = transpose(	expAt * B) * l
u = subs(subs(u, l1, l_star_2.l1), l2, l_star_2.l2);
int(u, 't', 'T0', 'T1')
a = mu2 / double(int(u, 't', T0, T1))
u = a * u

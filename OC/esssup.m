A = [-8 -10; 9 11]
B = [0; 3]
X0 = [2; -3]
X1 = [-2; -1]
T0 = sym(0)
T1 = log(sym(4))

syms t
syms t_lambda
D = det(A - t_lambda * eye(2))
res_lambda = solve(D)
x1 = null(A - res_lambda(1) * eye(2))
x2 = null(A - res_lambda(2) * eye(2))
c11 = -sym(9)
c12 = sym(9)
c21 = -sym(9)
c22 = sym(10)
x1 = [exp(t) * -sym(10) / sym(9); exp(t)]
x2 = [-exp(2 * t); exp(2 * t)]
expAt = [c11 * x1 + c12 * x2, c21 * x1 + c22 * x2]

syms l1 l2
XB = simple([l1 l2] * subs(expAt, t, T1 - tau) * B)

syms tau mu s
X_mu_t1_1 = simple(mu * int(subs(expAt, t, T1 - tau) * B, 'tau', T0, s))
X_mu_t1_2 = simple(mu * int(subs(expAt, t, T1 - tau) * B, 'tau', s, T1))

X_mu_0 = mu * int(subs(expAt, t, T1 - tau) * B, 'tau', T0, T1)
X_mu_1 = simple(X_mu_t1_1 - X_mu_t1_2)
X_mu_2 = simple(-X_mu_t1_1 + X_mu_t1_2)

syms l1 l2
L = [l1 l2] * X_mu_1
dLds = simple(diff(L, s))
X_mu_1_s = solve(dLds, 's')
L = [l1 l2] * X_mu_2
dLds = simple(diff(L, s))
X_mu_2_s = solve(dLds, 's')

tmp = simple(abs(subs(L, s, X_mu_1_s)))
dtmpdl1 = simple(diff(tmp, l1))
dtmpdl2 = simple(diff(tmp, l2))
solve(dtmpdl1, dtmpdl2, 'l1', 'l2')

V = (sym(450) * l1 ^ 2 - sym(930) * l1 * l2 + sym(481) * l2^2) / (l1 - l2)
V1 = simple(subs(V, l2, (sym(1) + sym(154) * l1) / sym(155)))

c = X1 - subs(expAt, t, T1 - T0) * X0

L1 = -154 * l1 + 155 * l2 - 1
L2 = 30 * l1 - 31 * l2
res = solve(L1, L2, 'l1', 'l2')
res.l1
res.l2

abs(subs(subs(V, l1, -sym(1)/4), l2, -sym(15) / 62))
mu_star = 10 / 3 / ans
%syms tau
%syms l1 l2
%s = transpose(B) * transpose(subs(expAt, t, T1 - tau)) * [l1; l2]
%int_s = int(s, 'tau', T0, T1)
%expr_mu0 = simple([l1 l2] * c / (l1 * (sym(7) - 9 * log(sym(2))) + l2 * (sym(21) - 18 * log(sym(2)))))
%expr_mu0 = simple([l1 l2] * c / int_s)
%dexpr_mu0_dl1 = simple(diff(expr_mu0, l1))
%dexpr_mu0_dl2 = simple(diff(expr_mu0, l2))
%l_star = solve(dexpr_mu0_dl1, dexpr_mu0_dl2, 'l1', 'l2')
%l_star.l1
%l_star.l2

%syms mu
%syms s
%X_mu_1 = int(subs(expAt, t, T1 - tau) * B * mu, 'tau', T0, s) - int(subs(expAt, t, T1 - tau) * B * mu, 'tau', s, T1)
%X_mu_2 = -int(subs(expAt, t, T1 - tau) * B * mu, 'tau', T0, s) + int(subs(expAt, t, T1 - tau) * B * mu, 'tau', s, T1)

%X_mu_1 = int(subs(expAt, t, T1 - tau) * B * mu, 'tau', T0, s)
%X_mu_2 = -int(subs(expAt, t, T1 - tau) * B * mu, 'tau', s, T1)

%tmp = [];
%tmp1 = [];
%ts = T0 : 0.1 : T1;
%for i_mu = 0 : 0.1 : 10
%i_mu = 5;
%for i = 1 : size(ts, 2)
%		tmp1 = [tmp1, double(subs(subs(X_mu_1, mu, i_mu), s, ts(i)))];
%		tmp = [tmp, double(subs(subs(X_mu_1, mu, i_mu), s, ts(i)) + subs(subs(X_mu_2, mu, i_mu), s, ts(i)))];
%	end
%for i = 1 : size(ts, 2)
%		tmp1 = [tmp1, -double(subs(subs(X_mu_1, mu, i_mu), s, ts(i)))];
%		tmp = [tmp, double(-subs(subs(X_mu_1, mu, i_mu), s, ts(i)) - subs(subs(X_mu_2, mu, i_mu), s, ts(i)))];
%	end
%end
%hold on;
%plot(tmp1(1, :), tmp1(2, :), 'g')
%plot(tmp(1, :), tmp(2, :))
%for i = 1 : size(tmp, 2)
%	plot([tmp(1, i) tmp1(1, i)], [tmp(2, i) tmp1(2, i)], 'r');
%end

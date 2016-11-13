A = [7 5; -10 -7]
B = [1; 0]
X0 = [0; 0]
X1 = [2; 1]
T0 = 0
syms T1

syms t
syms t_lambda
D = det(A - t_lambda * eye(2))
res_lambda = solve(D)
x1 = null(A - res_lambda(1) * eye(2))
x2 = null(A - res_lambda(2) * eye(2))

x = x1 * (cos(t) + i * sin(t))
c11 = 0
c12 = -10
c21 = 1
c22 = -7
x1 = [-sym(7) / 10 * cos(t) + sym(1) / 10 * sin(t); cos(t)];
x2 = [-sym(1) / 10 * cos(t) + sym(-7) / 10 * sin(t); sin(t)];
expAt = [c11 * x1 + c12 * x2, c21 * x1 + c22 * x2]

%syms tau t1
%s = transpose(B) *  transpose(subs(expAt, t, t1 - tau))
%under_int = abs(s * [sym(l1); sym(l2)])
subs tau

aaa = subs(expAt, t, T1 - tau) * B
syms s
ans1 = int(aaa, 'tau', 0, s)
ans2 = int(aaa, 'tau', s, T1)

res = simple(ans1 - ans2)


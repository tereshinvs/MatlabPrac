syms l1 l2 x1 x2 lambda
L = l1 * x1 + l2 * x2 + lambda * (2 * x1 ^ 2 + x2 ^ 2 - 3)
dLdx1 = diff(L, x1)
dLdx2 = diff(L, x2)
dLdlambda = diff(L, lambda)
res = solve(dLdx1, dLdx2, dLdlambda, 'x1', 'x2', 'lambda')
x1 = simple(res.x1)
x2 = simple(res.x2)

aaa = simple(2 * x1(1) ^ 2 + x2(1) ^ 2 - 3)

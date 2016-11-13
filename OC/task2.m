syms l1 l2 x1 x2 lambda

%L = l1 * x1 + l2 * x2 + lambda * (abs(x1) + 3 * x2 * x2 - 1)
%dLdx1 = diff(L, x1)
%dLdx2 = diff(L, x2)
%dLdlambda = diff(L, lambda)
%x_star = solve(dLdx1, dLdx2, dLdlambda, 'x1', 'x2', 'lambda')

% x1 >= 0
L = l1 * x1 + l2 * x2 + lambda * (x1 + 3 * x2 * x2 - 1)
dLdx1 = diff(L, x1)
dLdx2 = diff(L, x2)
dLdlambda = diff(L, lambda)
x_star = solve(dLdx1, dLdx2, dLdlambda, 'x1', 'x2', 'lambda')
res_x1 = [x_star.x1; x_star.x2]

% x1 < 0
L = l1 * x1 + l2 * x2 + lambda * (-x1 + 3 * x2 * x2 - 1)
dLdx1 = diff(L, x1)
dLdx2 = diff(L, x2)
dLdlambda = diff(L, lambda)
x_star = solve(dLdx1, dLdx2, dLdlambda, 'x1', 'x2', 'lambda')
res_x2 = [x_star.x1; x_star.x2]

rho1 = transpose([l1; l2]) * res_x1
rho2 = transpose([l1; l2]) * res_x2

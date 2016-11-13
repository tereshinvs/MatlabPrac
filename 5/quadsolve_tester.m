mex quadsolve.cpp
n = 10;
A = random('Uniform', 0, 1, n, n) + i * random('Uniform', 0, 1, n, n);
%B = random('Uniform', 0, 1, n, n) + i * random('Uniform', 0, 1, n, n);
%C = random('Uniform', 0, 1, n, n) + i * random('Uniform', 0, 1, n, n);
[X1, X2, D] = quadsolve(A, 2 * A, ones(size(A)));
disp(norm(A .* (X1.^2) + 2 * A .* X1 + ones(size(A))));
disp(norm(A .* (X2.^2) + 2 * A .* X2 + ones(size(A))));

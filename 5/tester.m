A = [1 -1; -1e-8 0];
X = inv_c(A);
disp(norm(A * X - eye(size(A))));

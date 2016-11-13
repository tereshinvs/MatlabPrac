n = 5;
A1 = zeros(2 * n + 1, 2 * n + 1);
A1(2 : 2 : 2 * n + 1, 1 : 2 * n : 2 * n + 1) = 10;
A1(1 : 2 * n : 2 * n + 1, 2 : 2 : 2 * n + 1) = 10;
A1(n : 2 : n + 2, n : 2 : n + 2) = 30;
A1(n + 1, n + 1) = 50;
disp(A1);

A2 = zeros(2 * n + 1, 2 * n + 1);
A2(2 : 2 : 2 * n + 1, 1) = 10;
A2(n, n) = 30;
A2 = A2 + rot90(A2) + rot90(A2, 2) + rot90(A2, 3);
A2(n + 1, n + 1) = 50;
disp(A2);

[x, y] = meshgrid(1 : 2 * n + 1, 1 : 2 * n + 1);
A3 = arrayfun(@(i, j) task04_get_number_at(i, j, n), x, y);
disp(A3);
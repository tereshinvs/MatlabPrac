n = 1;
pnts = random('Normal', 0, 1, 2, n);
[x, y] = meshgrid(1 : n, 1 : n);
A = arrayfun(@(v1_num, v2_num) task05_pseudo_scalar_mult(pnts(:, v1_num), pnts(:, v2_num)), x, y);
disp(pnts);
disp(A);

pnts1 = rot90(pnts, 3);
pnts1(:, 2) = -pnts1(:, 2);
B = pnts1 * pnts;
disp(B);

disp(A == B);
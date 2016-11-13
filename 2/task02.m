clc

%% Creating
A = random('Normal', 9, 0.001, 11, 9);
disp('A:');
disp(A);

%% Max diagonal element
res1 = max(diag(A));
disp('Max of diagonal elements of A:');
disp(res1);

%% Max and min prod/sum
col_prod = cumprod(A);
col_prod = col_prod(size(A, 1), :);
col_sum = cumsum(A);
col_sum = col_sum(size(A, 1), :);

res2_max = max(col_prod./col_sum);
res2_min = min(col_prod./col_sum);

disp('res2_max:');
disp(res2_max);

disp('res2_min:');
disp(res2_min);

%% Rows sorting
res2 = sort(A, 1, 'descend');
disp('Sorted matrix:');
disp(res2);
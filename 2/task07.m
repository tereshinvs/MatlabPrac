n = 10;
X = random('Discrete Uniform', 4, n, n) - 3;
nums = arrayfun(@(i) task07_get_first_non_zero_num(X(:, i)), 1 : n);
vals = arrayfun(@(i) X(nums(i), i), 1 : n);
disp(X);
disp(nums);
disp(vals);
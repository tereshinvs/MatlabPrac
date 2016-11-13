clc

A = zeros(5, 3);

x = random('Discrete Uniform', size(A, 1) - 1);
y = random('Discrete Uniform', size(A, 2) - 1);
A(x : (x + 1), y : (y + 1)) = A(x : (x + 1), y : (y + 1)) + 2;
disp(A);

A(1, :) = 1 : size(A, 2);
disp(A);

A(1 : 3, :) = [];
disp('Result A:');
disp(A);

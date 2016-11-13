function result = task10_matr_replace_by_ind(A)
% Realization of replacing part of matrix using implemented in Matlab
% vector-indeces.
    n = size(A, 1);
    m = size(A, 2);
    A(1 : 2 : end, 2 : 2 : end) = random('Normal', 0, 1, ceil(n / 2), floor(m / 2));
    result = A;
end
function result = task10_matr_replace_by_for(A)
% Realization of replacing part of matrix using for.
    n = size(A, 1);
    m = size(A, 2);
    B = random('Normal', 0, 1, ceil(n / 2), floor(m / 2));
    for i = 1 : ceil(n / 2)
        for j = 1 : floor(m / 2)
            A(2 * i - 1, 2 * j) = B(i, j);
        end
    end
    result = A;
end
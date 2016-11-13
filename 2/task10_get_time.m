function result = task10_get_time(fun, n, m)
% Counts time of working function fun on data matrix with size n x m.
    num = 5;
    res = 0;
    for i = 1 : num
        A = random('Normal', 0, 1, n, m);
        tic();
        fun(A);
        res = res + toc();
    end
    result = res / (num * 10^6);
end
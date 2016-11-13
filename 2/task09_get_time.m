function result = task09_get_time(fun, lng)
% Counts time of working function fun on data vector with length lng.
    num = 50;
    res = 0;
    for i = 1 : num
        v1 = random('Normal', 0, 1, 1, lng);
        v2 = random('Normal', 0, 1, 1, lng);
        tic();
        fun(v1, v2);
        res = res + toc();
    end
    result = res / num;
end
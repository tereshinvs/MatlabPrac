function result = task04_get_number_at(i, j, n)
% This function returns value in (2*n+1)x(2*n+1) matrix at (i, j) in
% task 4.
    result = 0;
    
    if (i == 1 || i == 2 * n + 1) && rem(j, 2) == 0
        result = 10;
    end
    if (j == 1 || j == 2 * n + 1) && rem(i, 2) == 0
        result = 10;
    end
    
    if i == n && j == n || i == n && j == n + 2
        result = 30;
    end
    if i == n + 2 && j == n || i == n + 2 && j == n + 2
        result = 30;
    end
    
    if i == n + 1 && j == n + 1
        result = 50;
    end
end
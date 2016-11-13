function result = task09_my_prod(v1, v2)
% My realization of scalar product of two vectors.
    result = 0;
    for i = 1 : size(v1, 1)
        result = result + v1(i) * v2(i);
    end
end
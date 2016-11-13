function result = task07_get_first_non_zero_num(v)
% This function returns the number of the first non-zero element in v.
    tmp = find(v);
    result = tmp(1);
end
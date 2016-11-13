function result = task12_is_row_member(v, B)
% This function returns 1 if row v is member of B and 0 otherwise.
    if size(v) == size(B, 2)
        result = any(arrayfun(@(i) all(v == B(i, :)), 1 : size(B, 1)));
    else
        result = 0;
    end
end
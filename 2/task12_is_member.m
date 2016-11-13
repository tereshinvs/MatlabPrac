function result = task12_is_member(A, B)
% This function is similar to ismember(A, B, 'rows').
    result = arrayfun(@(i) task12_is_row_member(A(i, :), B), 1 : size(A, 1));
end
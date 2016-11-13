function result = get_foreman_status(bombs, vict, rad)
% This function checks if foreman with coordinates vict is placed in one of
% circles with coordinates in bombs(i) and radius rad. Function return a
% string 'Foreman is alive' or 'Foreman is dead'.
    result = 'Foreman is alive';
    N = size(bombs, 1);
    for i = 1 : N
        if pdist2([get(bombs(i), 'XData') get(bombs(i), 'YData')], vict) <= rad
            result = 'Foreman is dead';
        end
    end
end
function result = get_foreman_coord(method, x_lim, y_lim)
% This function returns an 1-by-2 size array, which contains random coordinates of
% foreman. Random distribution is controled by method, coordinates are in
% [0, x_lim] x [0, y_lim] rectangle.
    if method == 1 % Normal distribution
        while true
            result = random('Normal', 0, 1, 1, 2);
            if (result(1) >= x_lim(1)) && (result(1) <= x_lim(2)) && (result(2) >= y_lim(1)) && (result(2) <= y_lim(2))
                break;
            end
        end
    end
    
    if method == 2 % Gamma distribution
        while true
            result = random('Gamma', 1, 1, 1, 2);
            if (result(1) >= x_lim(1)) && (result(1) <= x_lim(2)) && (result(2) >= y_lim(1)) && (result(2) <= y_lim(2))
                break;
            end
        end
    end
    
    if method == 3 % Uniform distribution
        while true
            result = random('Uniform', 0, max([x_lim(2), y_lim(2)]), 1, 2);
            if (result(1) >= x_lim(1)) && (result(1) <= x_lim(2)) && (result(2) >= y_lim(1)) && (result(2) <= y_lim(2))
                break;
            end
        end
    end
end
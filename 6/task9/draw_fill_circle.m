function draw_fill_circle(x, y, rad, color, line_width)
% This void function draws a red fill circle with centre in (x, y) and
% radius rad
    ang = 0 : 0.1 : 2 * pi;
    xp = rad * cos(ang);
    yp = rad * sin(ang);
    fill(xp + x, yp + y, color, 'LineWidth', line_width);
end

function result = trace(C1, C2)
	t = 0 : 0.01 : 1.1;
	x = [C1];
	y = [C2];
	for i = 2 : size(t, 2)
		xlast = x(end);
		ylast = y(end);
		x = [x; xlast + 2 * xlast * (t(i) - t(i - 1))];
		y = [y; ylast + (xlast + ylast) * (t(i) - t(i - 1))];
	end
	result = [x, y];
end

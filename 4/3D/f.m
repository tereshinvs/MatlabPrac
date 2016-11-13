function result = f(x, y, alpha)
	result = sin(alpha / 100 * (0.5 + sin(alpha / 30)) * sqrt(x.^2 + y.^2));
end

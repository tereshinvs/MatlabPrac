function result = f(x)
	EPS = 1e-15;
	if abs(x) < EPS
		result = 0;
	else
		result = x .* cos(log(abs(x)));
	end
end

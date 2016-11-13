function compareInterp(x, xx, f)
	fig = figure;
	hold on;
	plot(xx, f(xx), 'b', 'LineWidth', 2);
	plot(xx, interp1(x, f(x), xx, 'spline'), 'g');
	plot(xx, interp1(x, f(x), xx, 'nearest'), 'r');
	plot(xx, interp1(x, f(x), xx, 'cubic'), 'k');
	plot(xx, interp1(x, f(x), xx, 'linear'), 'm');
	
	legend('Original', 'Spline', 'Nearest', 'Cubic', 'Linear');
end

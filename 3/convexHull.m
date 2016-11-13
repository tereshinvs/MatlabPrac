function result = convexHull(x, y)
% This function is the same as standard convhull: it takes two vectors x
% and y and returns indeces of point on the edge of convex hull of points
% (x, y). It uses QuickHull algo.
	if size(x, 2) ~= 1 || size(y, 2) ~= 1 || size(x, 1) ~= size(y, 1) || size(x, 1) < 3
		error('Invalid arguments');
	end
	
	N = size(x, 1);
	pnts_orig = zeros(3, N);
	pnts_orig(1, :) = x;
	pnts_orig(2, :) = y;
	pnts_orig(3, :) = 1 : N;
	pnts = pnts_orig;
	pnts = (sortrows(pnts'))';
	
	% Get v(i) - v(0)
	v = pnts - repmat(pnts(:, 1), 1, N);
	v = v(1 : 2, :);
	
	v1 = rot90(v, 3);
	v1(:, 2) = -v1(:, 2);
	PPP = v1 * v; % pairwise pseudo-scalar product
	
	down = find(PPP(:, N) <= 0);
	down = pnts(3, down(:));
	
	up = find(PPP(:, N) >= 0);
	up = pnts(3, up(:));
	
	down_points = pnts_orig(:, down);
	up_points = pnts_orig(:, up);
	
	% down_convex_hull and up_convex_hull returns only numbers
	res_up = down_convex_hull(up_points);
	res_down = up_convex_hull(down_points);
		
	result = [res_down(1 : end - 1); flipud(res_up(1 : end))];
end

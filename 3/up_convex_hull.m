function result = up_convex_hull(pnts)
% This function returs upper convex hull for pnts for QuickHull algo.
	EPS = 10e-9;
	N = size(pnts, 2);
	if N <= 2
		result = pnts(3, :)';
		return;
	end
	
	A = pnts(2, 1) - pnts(2, N);
	B = pnts(1, N) - pnts(1, 1);
	C = pnts(1, 1) * pnts(2, N) - pnts(2, 1) * pnts(1, N);
	if abs(A) < EPS && abs(B) < EPS
		result = [pnts(3, 1); pnts(3, N)];
		return;
	end
	
	dist = abs((A * pnts(1, :) + B * pnts(2, :) + C) / sqrt(A * A + B * B));
	[max_dist, max_dist_elem] = max(dist);
	if max_dist < EPS
		result = [pnts(3, 1); pnts(3, N)];
		return;
	end

	% Left up convex hull
	v = pnts - repmat(pnts(:, 1), 1, N);
	v = v(1 : 2, :);
	
	v1 = rot90(v, 3);
	v1(:, 2) = -v1(:, 2);
	PPP = v1 * v; % pairwise pseudo-scalar product

	left = find(PPP(:, max_dist_elem) <= 0);
	left_points = pnts(:, left);

	% Right up convex hull
	v = pnts - repmat(pnts(:, max_dist_elem), 1, N);
	v = v(1 : 2, :);
	
	v1 = rot90(v, 3);
	v1(:, 2) = -v1(:, 2);
	PPP = v1 * v; % pairwise pseudo-scalar product

	right = find(PPP(:, N) <= 0);
	right_points = pnts(:, right);
	
	left_res = up_convex_hull(left_points);
	right_res = up_convex_hull(right_points);
	result = [left_res(1 : end - 1); right_res];
end

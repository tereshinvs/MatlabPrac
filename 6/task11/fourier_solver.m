function result = fourier_solver(phi, a, l, T, k, dl, dT)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% This function solves differential equation:                             %
% u_t = a^2 u_xx                                                          %
% u(0, t) = u(l, t) = 0                                                   %
% t belongs to [0, T]                                                     %
% u(x, 0) = phi(x)                                                        %
% x belongs to [0, l].                                                    %
% Function returns n-by-m matrix A, where                                 %
% A(i, j) = u((i - 1) * dl, (j - 1) * dT), and arguments to u belongs to  %
% its limits.                                                             %
% According to solving method, result is the descending serie. Function   %
% returns sums of first k members of this serie.                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	lambda = ((1 : k) * pi / l) .^ 2;
	sqrt_lambda = sqrt(lambda);
	C = zeros(1, k);
	for i = 1 : k
		C(i) = 2.0 / l * integral(@(x) phi(x) .* sin(sqrt_lambda(i) .* x), 0, l);
	end
	xs = 0 : dl : l;
	ts = 0 : dT : T;
	n = size(xs, 2);
	m = size(ts, 2);
	result = zeros(n, m);
	for i = 1 : n
		for j = 1 : m
			result(i, j) = 0;
			for q = 1 : k
				result(i, j) = result(i, j) + C(q) * exp(-a * a * lambda(q) * ts(j)) * sin(sqrt_lambda(q) * xs(i));
			end
		end
	end
end

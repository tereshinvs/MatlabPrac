phi = @(x) 2.9 * sin(pi * x) + 4.8 * sin(3 * pi * x);
a = sqrt(0.4);
l = 1;
T = 5;
k = 10;
dl = 0.01;
dT = 0.0001;

res = fourier_solver(phi, a, l, T, k, dl, dT);
x = 0 : dl : l;

for i = 1 : size(res, 2)
	plot(x, res(:, i), 'r');
	axis manual;
	axis([0 l 0 10]);
	M(i) = getframe();
end

%hold on
%axis manual;
%axis([0 l 0 1]);
%xlabel('x');
%ylabel('u');

%plot(x, res(:, 10), 'b');
%plot(x, res(:, 100), 'g');
%plot(x, res(:, 600), 'r');

%legend('t = 0.01', 't = 0.1', 't = 0.6');

%true_res = @(x, t) (2.9 .* exp(-0.4 .* pi.^2 .* t) * sin(pi .* x) + 4.8 .* exp(-3.6 .* pi .^ 2 .* t) .* sin(3 .* pi .* x));

%tmp = zeros(size(res, 1), size(res, 2));
%t = 0 : dT : T;
%for i = 1 : size(res, 1)
%	for j = 1 : size(res, 2)
%		tmp(i, j) = res(i, j) - true_res(x(i), t(j));
%	end
%end

%norm(tmp)

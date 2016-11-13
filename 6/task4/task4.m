x = -1 : 0.001 : 1;
%x = 0 : 0.001 : 1;
y = zeros(1, size(x, 2));
for i = 1 : size(x, 2)
	y(i) = fzero(@f, x(i));
end
hold on;
plot(x, f(x), 'g');
plot(x, y);

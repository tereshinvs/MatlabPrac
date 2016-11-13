N = 100;
S = log(2);
n = 0 : N;
Sn = [0];
for i = 1 : N
	Sn = [Sn; Sn(end) + (-1).^(i - 1) / i];
end
hold on
plot(n, Sn);
plot([0 N], [S S], 'g')

% |r_n| = |(-1)^n / (n + 1) + (-1)^(n + 1) / (n + 2) + ...| < 1 / (n + 1)
plot(n, 1 ./ (n + 1), 'r')

legend('S_n', 'S = ln2', '\phi(n)')

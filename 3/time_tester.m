N = 30;
STEP = 100;
RUN_TIMES = 5;
tests = STEP : STEP : (STEP * N)
my_time = zeros(1, N);
std_time = zeros(1, N);
for i = 1 : N
	disp(i);
	curtest_x = random('Normal', 0, 1, tests(i), 1);
	curtest_y = random('Normal', 0, 1, tests(i), 1);
	tmp_time = 0;
	for j = 1 : RUN_TIMES
		tic();
		convhull(curtest_x, curtest_y);
		tmp_time = tmp_time + toc();
	end
	std_time(i) = tmp_time / RUN_TIMES;

	tmp_time = 0;
	for j = 1 : RUN_TIMES
		tic();
		convexHull(curtest_x, curtest_y);
		tmp_time = tmp_time + toc();
	end
	my_time(i) = tmp_time / RUN_TIMES;
end

hold on;
plot(tests, my_time, 'g');
plot(tests, std_time, 'r');
legend('My convex hull algo', 'Standard convex hull algo');
xlabel('Number of points');
ylabel('Time in seconds');

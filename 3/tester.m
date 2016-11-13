RUN_TIMES = 5;
load('test_data.mat', 'x', 'y', 'test_names');

N = size(x, 1);
M = size(y, 1);
K = size(test_names, 1);

if (N ~= M) || (N ~= K)
	error('Invalid data');
end


for i = 1 : N
	disp('*********************************************');
	disp(i);
	disp(test_names(i));
	disp('*********************************************');
	%disp('X:');
	%disp(x(i, :));
	%disp('Y:');
	%disp(y(i, :));
	
	my_time = 0;
	std_time = 0;
	for j = 1 : RUN_TIMES
		tic();
		my_conv = convexHull(x(i, :)', y(i, :)');
		my_time = my_time + toc();
		tic();
		std_conv = convhull(x(i, :)', y(i, :)');
		std_time = std_time + toc();
	end
	my_time = my_time / RUN_TIMES;
	std_time = std_time / RUN_TIMES;
	
	%disp('My convex hull algo:');
	%disp(my_conv);
	%disp('Standard convex hull algo:');
	%disp(std_conv);
	disp('my_conv == std_conv:');
	disp(compare_conv(my_conv, std_conv));
	
	disp('My algo time:');
	format longG;
	disp(my_time);
	disp('Standard algo time:');
	format longG;
	disp(std_time);
end

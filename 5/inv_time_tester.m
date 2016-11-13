mex inv_c.cpp
RUN_TIMES = 3;
POLYNOM_POWER = 8;

n = 10 : 1 : 60;
inv_res = zeros(1, size(n, 2));
inv_c_res = zeros(1, size(n, 2));
inv_matlab_res = zeros(1, size(n, 2));
for i = 1 : size(n, 2)
	disp(n(i));
	
	inv_res(i) = 0;
	inv_c_res(i) = 0;
	inv_matlab_res(i) = 0;
	
	for j = 1 : RUN_TIMES
		A = random('Uniform', 0, 1, n(i), n(i));
		tic;
		X1 = inv(A);
		inv_res(i) = inv_res(i) + toc();
		
		tic;
		X2 = inv_c(A);
		inv_c_res(i) = inv_c_res(i) + toc();
		
		tic;
		X3 = inv_matlab(A);
		inv_matlab_res(i) = inv_matlab_res(i) + toc();
	end
	
	inv_res(i) = inv_res(i) / RUN_TIMES;
	inv_c_res(i) = inv_c_res(i) / RUN_TIMES;
	inv_matlab_res(i) = inv_matlab_res(i) / RUN_TIMES;
end
hold on;
plot(n, inv_res, 'g');
plot(n, inv_c_res, 'b');
plot(n, inv_matlab_res, 'r');
legend('inv', 'inv\_c', 'inv\_matlab');

p1 = polyfit(n, inv_res, POLYNOM_POWER);
p2 = polyfit(n, inv_c_res, POLYNOM_POWER);
p3 = polyfit(n, inv_matlab_res, POLYNOM_POWER);

disp('Linear regression of run time of inv:');
disp(p1);
disp('Linear regression of run time of inv_c:');
disp(p2);
disp('Linear regression of run time of inv_matlab:');
disp(p3);

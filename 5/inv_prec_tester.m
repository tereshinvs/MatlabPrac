mex inv_c.cpp
RUN_TIMES = 3;

n = 3 : 3 : 99;
inv_res = zeros(1, size(n, 2));
inv_c_res = zeros(1, size(n, 2));
inv_matlab_res = zeros(1, size(n, 2));
inv_linsolve_res = zeros(1, size(n, 2));
for i = 1 : size(n, 2)
	inv_res(i) = 0;
	inv_c_res(i) = 0;
	inv_matlab_res(i) = 0;
	inv_linsolve_res(i) = 0;
	
	for j = 1 : RUN_TIMES
		A = random('Uniform', 0, 1, n(i), n(i));
		X1 = inv(A);
		X2 = inv_c(A);
		X3 = inv_matlab(A);
		inv_res(i) = inv_res(i) + norm(A * X1 - eye(n(i)));
		inv_c_res(i) = inv_c_res(i) + norm(A * X2 - eye(n(i)));
		inv_matlab_res(i) = inv_matlab_res(i) + norm(A * X3 - eye(n(i)));
		inv_linsolve_res(i) = inv_linsolve_res(i) + norm(A * linsolve(A, eye(n(i)) - eye(n(i))));
	end
	
	inv_res(i) = inv_res(i) / RUN_TIMES;
	inv_c_res(i) = inv_c_res(i) / RUN_TIMES;
	inv_matlab_res(i) = inv_matlab_res(i) / RUN_TIMES;
	inv_linsolve_res(i) = inv_linsolve_res(i) / RUN_TIMES;
end
hold on;
plot(n, inv_res, 'g');
plot(n, inv_c_res, 'b');
plot(n, inv_matlab_res, 'r');
plot(n, inv_linsolve_res, 'm');
legend('inv', 'inv\_c', 'inv\_matlab', 'inv\_linsolve');

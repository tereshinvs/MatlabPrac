x = 0 : 0.1 : pi;
xx = 0 : 0.01 : pi;

f1 = @sin;
f1_4diff_max = 1.0;
apriori = f1_4diff_max * max(x(2 : end) - x(1 : end - 1)).^4

hold on;
plot([xx(1) xx(end)], [apriori apriori], 'g');

plot(xx, abs(interp1(x, f1(x), xx, 'spline') - f1(xx)), 'b');

figure
x = [-1 0 1 2];
y = [0 0 0 0];
xx = [-1 : 0.01 : 2];
f2 = @(x) (x+1).*x.*(x-1).*(x-2);
f2_4diff_max = 24;
apriori = f2_4diff_max * max(x(2 : end) - x(1 : end - 1)).^4

hold on;
plot([xx(1) xx(end)], [apriori apriori], 'g');
 
plot(xx, abs(interp1(x, f2(x), xx, 'spline') - f2(xx)), 'b');
 
% figure
% x = -1 : 0.1 : 1;
% xx = -1 : 0.01 : 1;
% f2 = @(x) x;
% f2_4diff_max = 0.0;
% apriori = f2_4diff_max * max(x(2 : end) - x(1 : end - 1)).^4
% 
% hold on;
% plot([xx(1) xx(end)], [apriori apriori], 'g', 'LineWidth', 2);
% 
% plot(xx, abs(interp1(x, f2(x), xx, 'spline') - f2(xx)), 'b');

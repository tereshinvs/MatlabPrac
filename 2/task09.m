hold on;

disp('Counting a time of my_prod function...');
x = 1 : 500 : 10000;
y = zeros(size(x, 2), 1);
for i = 1 : size(x, 2)
    y(i) = task09_get_time(@task09_my_prod, x(i));
end
plot(x, y, 'r');
%text('Position', [x(1), y(1)], 'String', 'my\_prod', 'Color', 'r');

disp('Counting a time of std_prod function...');
%y = arrayfun(@(lng) task09_get_time(@task09_std_prod, lng), x);
y = zeros(size(x, 2), 1);
for i = 1 : size(x, 2)
    y(i) = task09_get_time(@task09_std_prod, x(i));
end
size(x)
size(y)
plot(x, y, 'g');
%text('Position', [x(1), y(1)], 'String', 'std\_prod', 'Color', 'g');

legend('my\_prod', 'std\_prod');
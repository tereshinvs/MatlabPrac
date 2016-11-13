hold on;

%[x, y] = meshgrid(1 : 50 : 1000, 1 : 50 : 1000);
disp('Counting time of task10_matr_replace_by_for...');
%z = arrayfun(@(n, m) task10_get_time(@task10_matr_replace_by_for, n, m), x, y);
x = 1 : 50 : 1000;
y = zeros(size(x, 2), 1);
for i = 1 : size(x, 2)
    y(i) = task10_get_time(@task10_matr_replace_by_for, x(i), x(i));
end
plot(x, y, 'r');
%text('Position', [x(1), y(1), z(1)], 'String', 'task10\_matr\_replace\_by\_for', 'Color', 'r');

disp('Counting time of task10_matr_replace_by_ind...');
y = zeros(size(x, 2), 1);
for i = 1 : size(x, 2)
    y(i) = task10_get_time(@task10_matr_replace_by_ind, x(i), x(i));
end
%z = arrayfun(@(n, m) task10_get_time(@task10_matr_replace_by_ind, n, m), x, y);
plot(x, y, 'g');
%text('Position', [x(1), y(1), z(1)], 'String', 'task10\_matr\_replace\_by\_ind', 'Color', 'g');

legend('task10\_matr\_replace\_by\_for', 'task10\_matr\_replace\_by\_ind');
xlabel('Matrix size');
ylabel('Working time');
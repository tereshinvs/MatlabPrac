[x y] = meshgrid(-40 : 4 : 40, -40 : 4 : 40);
px = 2 * x;
py = x + y;
% Узел
figure;
hold on;
quiver(x, y, px, py);
legend('1 - узел');
 
% [x y] = meshgrid(-1 : 0.1 : 1, -1 : 0.1 : 1);
% px = x;
% py = y;
% % Дикритический узел
% figure;
% quiver(x, y, px, py);
% legend('2 - дикритический узел');
% 
% [x y] = meshgrid(-1 : 0.1 : 1, -1 : 0.1 : 1);
% px = x + y;
% py = x - y;
% % Седло
% figure;
% quiver(x, y, px, py);
% legend('3 - седло');
% 
% [x y] = meshgrid(-1 : 0.1 : 1, -1 : 0.1 : 1);
% px = x + y;
% py = -2 * x + y;
% % Фокус (неуст.)
% figure;
% quiver(x, y, px, py);
% legend('4 - фокус');
% 
% [x y] = meshgrid(-1 : 0.1 : 1, -1 : 0.1 : 1);
% px = -2 * x - 5 * y;
% py = 2 * x + 2 * y;
% % Фокус (неуст.)
% figure;
% quiver(x, y, px, py);
% legend('5 - центр');

%figure
ang = 0 : 0.3 : 2 * pi;
rad = 5;
xp = rad * cos(ang);
yp = rad * sin(ang);

for i = 1 : size(ang, 2) 
	X = trace(xp(i), yp(i));
	plot(X(:, 1), X(:, 2), 'r');
end

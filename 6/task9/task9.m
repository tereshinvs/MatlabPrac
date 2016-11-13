alpha = 0.1;

left = -0.5;
right = 0.5;
down = -0.5;
up = 0.5;

rad = 0.05;

dt = 0.001;
PAUSE_TIME = 0.001;

sqrt_alpha = sqrt(alpha);
axis manual;
axis([left right down up]);
[x y] = ginput(1);
[vx vy] = ginput(1);
while true
	draw_fill_circle(x, y, rad, [1 0 0], 1);
	axis manual;
	axis([left right down up]);
	
	ax = -alpha * x;
	ay = -alpha * y;

	new_x = x + vx * dt + ax * dt ^ 2 / 2;
	if new_x + rad > right || new_x - rad < left
		vx = -vx;
	end
	new_y = y + vy * dt + ay * dt ^ 2 / 2;
	if new_y + rad > right || new_y - rad < left
		vy = -vy;
	end
	
	x = x + vx * dt + ax * dt ^ 2 / 2;
	y = y + vy * dt + ay * dt ^ 2 / 2;

	vx = vx + ax * dt;
	vy = vy + ay * dt;
	
	pause(PAUSE_TIME);
end

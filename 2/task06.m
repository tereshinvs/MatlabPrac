n = 10;
m = 15;
v1 = random('Uniform', -5, 5, 1, n);
v2 = random('Uniform', -5, 5, 1, m);

v1_min = min(v1);
v1_max = max(v1);

v2_min = min(v2);
v2_max = max(v2);

disp(v1);
disp(v2);
disp(max([v1_max - v2_min, v2_min - v1_max, v1_min - v2_max, v2_max - v1_min]));
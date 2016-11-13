syms x
%f = x.^5 + 3*x.^4 - 4*x.^2 + x - 1;
f = x .* abs(x)
dfdx = diff(f, x)

% f' = 5x^4 + 12x^3 - 8x + 1
% f'' = 20x^3 + 36x^2 - 8
% f''' = 60x^2 + 72x
% f''' = 0 <=> x = 0 x = -72/6
% => max(f'') = f''(right) = M2
% => |psy+| = |L+ - f'| <= 0.5 * M2 * max(h)

% f'''' = 120x + 72
% f'''' = 0 <=> x = -72/120
% => max(f''') = f'''(right) = M3
% => |psy0| = |L0 - f'| <= 1/6 * M3 * max(h)^2

STEP = logspace(-18, -6, 500);
figure;
%loglog(STEP, abs(double(subs(dfdx, x, 0)) - (double(subs(f, x, STEP)) - double(subs(f, x, 0))) ./ STEP));
hold on;
loglog(STEP, abs(double(subs(dfdx, x, 0)) - (double(subs(f, x, STEP)) - double(subs(f, x, -STEP))) ./ (2.0 .* STEP)), 'g');
hold on
%loglog(STEP, 0.5 * M2 .* STEP, 'r');
%loglog(STEP, 1/6 * M3 .* STEP.^2, 'm');
%loglog(STEP, 0.5 .* 2 .* STEP, 'r');
loglog(STEP, 0 .* STEP, 'm');
grid on;
legend('Right', 'Central', 'Right velocity', 'Central velocity');

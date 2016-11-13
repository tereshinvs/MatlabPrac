% Best spline 
compareInterp(0 : 1 : pi, 0 : 0.1 : pi, @sin);

% Best cubi5c
compareInterp(0 : 1 : 4, 0 : 0.01 : 4, @(x) x.^3);

% Best linear
compareInterp(-4 : 1 : 4, -4 : 0.01 : 4, @abs);

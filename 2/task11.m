A = rand(3)
B = flipud(A');
disp(A);
disp(B);
disp(B == rot90(A));
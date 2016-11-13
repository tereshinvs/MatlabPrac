N = 50;
points = [random('Uniform', 0, 0.3, N / 2, 2); random('Uniform', 0.7, 1, N / 2, 2)];
save('random_uniform.mat', 'points');

N = 200;

x = [];
y = [];
test_names = {};

%test_names = cat(1, test_names, {'Handmade test #1'});
%x = [x; 1 : N / 2, 1 : N / 2];
%y = [y; zeros(1, N / 2), ones(1, N / 2)];

%test_names = cat(1, test_names, {'Handmade test #2'});
%x = [x; 1 : N];
%`y = [y; zeros(1, N)];

test_names = cat(1, test_names, {'Simple random test #1'});
x = [x; random('Uniform', 0, 1, 1, N)];
y = [y; random('Uniform', 0, 1, 1, N)];

test_names = cat(1, test_names, {'Simple random test #2'});
x = [x; random('Uniform', 0, 1, 1, N)];
y = [y; random('Uniform', 0, 1, 1, N)];

test_names = cat(1, test_names, {'Simple random test #3'});
x = [x; random('Uniform', 0, 1, 1, N)];
y = [y; random('Uniform', 0, 1, 1, N)];

test_names = cat(1, test_names, {'Simple random test #4'});
x = [x; random('Uniform', 0, 1, 1, N)];
y = [y; random('Uniform', 0, 1, 1, N)];

test_names = cat(1, test_names, {'Simple random test #5'});
x = [x; random('Uniform', 0, 1, 1, N)];
y = [y; random('Uniform', 0, 1, 1, N)];

test_names = cat(1, test_names, {'Normal distribution test #1'});
x = [x; random('Normal', 0.5, 1, 1, N)];
y = [y; random('Normal', 0.5, 1, 1, N)];

test_names = cat(1, test_names, {'Normal distribution test #2'});
x = [x; random('Normal', 0, 1, 1, N)];
y = [y; random('Normal', 0, 1, 1, N)];

test_names = cat(1, test_names, {'Normal distribution test #3'});
x = [x; random('Normal', 0, 1, 1, N)];
y = [y; random('Normal', 0, 20, 1, N)];

test_names = cat(1, test_names, {'Normal distribution test #4'});
x = [x; random('Normal', 100, 10, 1, N)];
y = [y; random('Normal', 0, 20, 1, N)];

test_names = cat(1, test_names, {'Normal distribution test #5'});
x = [x; random('Normal', 1, 5, 1, N)];
y = [y; random('Normal', -1, 5, 1, N)];

test_names = cat(1, test_names, {'Gamma distribution test #1'});
x = [x; random('Gamma', 3, 1, 1, N)];
y = [y; random('Gamma', 3, 20, 1, N)];

test_names = cat(1, test_names, {'Gamma distribution test #2'});
x = [x; random('Gamma', 3, 20, 1, N)];
y = [y; random('Gamma', 3, 20, 1, N)];

test_names = cat(1, test_names, {'Gamma distribution test #3'});
x = [x; random('Gamma', 12345, 1, 1, N)];
y = [y; random('Gamma', 123, 20, 1, N)];

test_names = cat(1, test_names, {'Gamma distribution test #4'});
x = [x; random('Gamma', 3, 11, 1, N)];
y = [y; random('Gamma', 3, 20, 1, N)];

test_names = cat(1, test_names, {'Gamma distribution test #5'});
x = [x; random('Gamma', 33, 111, 1, N)];
y = [y; random('Gamma', 3, 20, 1, N)];

test_names = cat(1, test_names, {'Cluster test #1'});
x = [x; random('Normal', 0, 1, 1, N / 2), random('Normal', 100, 1, 1, N / 2)];
y = [y; random('Normal', 0, 1, 1, N / 2), random('Normal', 100, 1, 1, N / 2)];

test_names = cat(1, test_names, {'Cluster test #2'});
x = [x; random('Normal', -100, 10, 1, N / 2), random('Normal', 100, 1, 1, N / 2)];
y = [y; random('Normal', 0, 1, 1, N / 2), random('Normal', 100, 10, 1, N / 2)];

test_names = cat(1, test_names, {'Cluster test #3'});
x = [x; random('Normal', 0, 1, 1, N / 2), random('Uniform', 100, 200, 1, N / 2)];
y = [y; random('Normal', 0, 1, 1, N / 2), random('Normal', 100, 1, 1, N / 2)];

test_names = cat(1, test_names, {'Cluster test #4'});
x = [x; random('Normal', 0, 1, 1, N / 4), random('Normal', 100, 1, 1, N / 4), random('Normal', 0, 1, 1, N / 4), random('Normal', 100, 1, 1, N / 4)];
y = [y; random('Normal', 0, 1, 1, N / 4), random('Normal', 0, 1, 1, N / 4), random('Normal', 100, 1, 1, N / 4), random('Normal', 100, 1, 1, N / 4)];

test_names = cat(1, test_names, {'Cluster test #5'});
x = [x; random('Normal', 0, 1, 1, N / 4), random('Normal', 1000, 1, 1, N / 4), random('Normal', 0, 1, 1, N / 4), random('Normal', 100, 1, 1, N / 4)];
y = [y; random('Normal', 0, 1, 1, N / 4), random('Normal', -1000, 1, 1, N / 4), random('Normal', 100, 1, 1, N / 4), random('Normal', 100, 1, 1, N / 4)];

save('test_data.mat', 'x', 'y', 'test_names');

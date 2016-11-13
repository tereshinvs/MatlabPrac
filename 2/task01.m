% 8?

%% 0
clc;
n = input('Input n:\n');
if isprime(n)
    disp([num2str(n), ' is prime.']);
else
    disp([num2str(n), ' isn''t prime.']);
end

%% 1
disp('Task 1.1');
res1 = 7 : 7 : n;
disp(res1);

%% 2
disp('Task 1.2');
res2 = repmat((2 : (n + 1))', 1, n);
disp(res2);

%% 3
disp('Task 1.3');
B = vec2mat(1 : ((n + 1) ^ 2), n + 1);
disp('B:');
disp(B);

c = B(:)';
%c = reshape(B', 1, (n + 1) ^ 2);
disp('c:');
disp(c);

D = B(:, n : (n + 1));
disp('D:');
disp(D);

%% 4
disp('Task 1.4');
a = 0;
sigma = 1;
%v1 = random('Normal', a, sigma, 1, n);
%v2 = random('Normal', a, sigma, 1, n);
v1 = a + sigma * randn(1, n);
v2 = a + sigma * randn(1, n);

format
disp('v1:');
disp(v1);
format hex
disp('v2:');
disp(v2);

format
format shortEng
disp('Array multiplication of v1 and v2:');
disp(v1.*v2);

format
disp('Array division of v1 and v2:');
disp(v1./v2);
% AMATH 584 HW6 Problem 2
% Tianbo Zhang 1938501
% Tester profile

% Set the paramete m
m = 4000;

% Generate random true solution xt
xt = randn(m,1);

% Generate the random vector for C's first column
c_first = randn(m,1);
C = gallery('circul', c_first);

% Generate random vectors a and b
a = randn(m, 1);
b = randn(m, 1);
v =(C + a * b.')*xt; 

% Test the method
t = tic;
x_fast = FastSolveCirculant(C, a, b, v);
out_fast = toc;

% Naive approach
M = C + a * b.';
t = tic;
x_naive = M\v;
out_naive = toc;

% Report the accuracy and time comparison
accuracy = norm(xt - x_fast)/norm(xt);
fprintf('Accuracy of Fast Method: %e\n', accuracy);
fprintf('Time taken by Fast Method: %f seconds\n', out_fast);
fprintf('Time taken by Naive Method: %f seconds\n', out_naive);

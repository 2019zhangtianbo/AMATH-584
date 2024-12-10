% AMATH 584 HW3 P4 part c
% Tianbo Zhang

% Part i: Accuracy Test
m = 2048;
k = 50;
X = randn(m, k);
Y = randn(m, k);
A = X*Y.';
[U, S, V] = LRsvd(X, Y);
result = U*S*V.';
error = norm(A - result)/norm(A);
fprintf('Accuracy error: %e\n', error);

% Part ii: Timing Test
k = 50;
lrsvd_time = zeros(7,1);
naive_time = zeros(7,1);
mj = 2.^(6:12);
i = 1;
for mi = mj
    X = randn(mi, k);
    Y = randn(mi, k);
    
    % Record time for naive algorithm
    tic;
    A = X*Y.';
    svd(A);
    naive_time(i) = toc;

    % Record time for LRsvd algorithm
    tic;
    LRsvd(X, Y);
    lrsvd_time(i) = toc;

    i = i+1;
end

figure;
semilogy(mj, naive_time, '-o', 'DisplayName', 'Naive SVD');
hold on;
semilogy(mj, lrsvd_time, '-x', 'DisplayName', 'LR SVD');
xlabel('m');
ylabel('Time (seconds)');
legend;
title('Comparison between Naive SVD and LRSVD');
grid on;

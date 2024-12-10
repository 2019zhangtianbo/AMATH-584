% AMATH 584 HW2 Problem 5 Tianbo Zhang
% Part a
m = 500;
A = zeros(m,m);
x = linspace(0, (m-1)/(2*m), m);
y = x(m) + linspace(1.5/m, (m + 0.5)/m, m);
A = 1./(x.' - y);
[U, S, V] = svd(A);
s = diag(S);
semilogy(1:m, s);
xlabel('Index');
ylabel('Singular Values');
title('Singular values of A');

% Part b
E = zeros(10, 1);
for j = 1:10
    A_j = U(:, 1:j) * S(1:j, 1:j) * V(:, 1:j)';
    E(j) = norm(A - A_j);
end
figure(2);
semilogy(1:10, E, 'bo', 'DisplayName', 'Errors');
hold on;
semilogy(1:10, s(2:11), 'rs', 'DisplayName', 'Singular Values 2-11');
legend;
xlabel('Rank (j)');
ylabel('Magnitude');
title('Errors of low-rank approximations vs. Singular values');
hold off;

% Part c
m = 500;
B = zeros(m,m);
for j = 1:m
    for k = 1:m
        xj = (j - 1) / m;
        yk = (k + 1/2) / m;
        B(j,k) = 1 / (xj - yk);
    end
end
[U_b, S_b, V_b] = svd(B);
s_b = diag(S_b);
figure;
semilogy(s_b, 'bo-');
xlabel('Index');
ylabel('Singular Value');
title('Singular values of matrix B');
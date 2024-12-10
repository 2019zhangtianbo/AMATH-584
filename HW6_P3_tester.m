% AMATH 584 HW6 Problem 3
% Tianbo Zhang 1938501
% Tester profile for methods in probolem 3

% Set up the initial condition
m = 2048;
p = 20;
A = rand(m, m);
max_error = 0;

% Find x(t) for 1 to p steps
for k = 1:p
    Bk = generateRandomB(m);
    xk_true = rand(m, 1);
    fk = (A+Bk)*xk_true ;
    if k == 1
        [P, L, U, xk] = firstsolve(A, Bk, fk);
    else
        xk = stepsolve(P, L, U, Bk, fk);
    end
    
    % Calculate the error and compare to the max
    error_k = norm(xk_true - xk, 2)/norm(xk_true);
    max_error = max(max_error, error_k);
end
fprintf('Maximum error over %d timesteps: %.16e\n', p, max_error);

function Bk = generateRandomB(m)
    % Generate a random m x m matrix Bk with non-zero entries only on the
    % first and last column

    % Initialize Bk with zeros
    Bk = zeros(m, m);

    % Randomize the first and last rows
    Bk(:, 1) = rand(m, 1);
    Bk(:, m) = rand(m, 1);
end
% AMATH 584 HW7 Problem 4 Part b
% Tianbo Zhang 1938501
% Implement the Power Iteration to compute an approximation to the
% eigenvalue of largest absolute value and its corresponding eigenvector

% Matrix setup
n = 10;
A = 2 * eye(n,n);
for i = 1:n-1
    A(i+1,i) = -1;
    A(i,i+1) = -1;
end

% Precondition setup
w = rand(n,1);
v = w / norm(w);
error = 1.e-6;
cur_error = 10;
error_list = [];

% Start the Power Iteration
while cur_error > error
    w = A*v;
    v = w / norm(w);
    ew = v' * A * v;
    cur_error = norm(A*v - ew * v);
    error_list(end+1) = cur_error;
end

plot([1:length(error_list)], error_list);
title("Error at each Iteration");
xlabel("Iteration");
ylabel("Error");
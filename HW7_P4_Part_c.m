% AMATH 584 HW7 Problem 4 Part b
% Tianbo Zhang 1938501
% Implement the Inverse Iteration with s = 1 shift to compute an approximation 
% to the eigenvalue that is closest to 1 and its corresponding eigenvector

% Matrix setup
n = 10;
A = 2 * eye(n,n);
for i = 1:n-1
    A(i+1,i) = -1;
    A(i,i+1) = -1;
end

% Precondition setup
s = 1;
w = rand(n,1);
v = w / norm(w);
error = 1.e-6;
shift_A = A - s*eye(n);
cur_error = 10;
error_list = [];

% Start the iteration
while cur_error > error
    w = shift_A \ v;
    v = w / norm(w);
    ew = v' * A * v;
    cur_error = norm(A * v - ew * v);
    error_list(end+1) = cur_error;
end

plot([1:length(error_list)], error_list);
title("Error at each Iteration");
xlabel("Iteration");
ylabel("Error");
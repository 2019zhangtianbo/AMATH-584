% AMATH 584 Final Exam Problem 6
% Tianbo Zhang 1938501
% Implement the sepcialized LU factorization in problem 5

function x = trisolve(dl, d0, du, b)
    n = length(d0);
    y = b;
    % Forward substitution for Ly = b
    for i = 2:n
        % Calculate the elimination rate for the current subdiagonal term
        mult = dl(i-1) / d0(i-1);
        % Calculate the new diagonal term for next iteration
        d0(i) = d0(i) - mult*du(i-1);
        % Calculate the current y term
        y(i) = y(i) - mult*y(i-1);
    end

    % Backward substitution for Ux = y
    x = zeros(n, 1);
    % Solve the last term
    x(n) = y(n) / d0(n);
    for i = n-1:-1:1
        % Compute x using back substitution
        x(i) = (y(i) - du(i) * x(i + 1)) / d0(i);
    end
end

% AMATH 584 HW6 Problem 3
% Tianbo Zhang 1938501
% Method for solving (A+Bk)xk = fk for subsequent timesteps
function xk = stepsolve(P, L, U, Bk, fk)
    % Find A inverse by A^-1 = U^-1 * L^-1 * P
    Ai = inv(U) * inv(L) * P;
    
    % Set up X and Y where B = XCY and C is the r*r identity matrix
    [m,m] = size(Bk);
    X = zeros(m,2);
    X(:,1) = Bk(:,1);
    X(:,2) = Bk(:,m);
    Y = zeros(2, m);
    Y(1,1) = 1;
    Y(2,m) = 1;

    % Use Sherman-Morrison Woodburry formula to find (A + XCY)^-1
    answer_Ai_fk = Asolver(P, L, U, fk);
    answer_Ai_X = Asolver(P ,L ,U, X);
    xk = answer_Ai_fk - answer_Ai_X * inv(eye(2) + Y * answer_Ai_X) * Y * answer_Ai_fk;
end
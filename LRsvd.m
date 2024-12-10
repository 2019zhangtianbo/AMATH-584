% AMATH 584 HW3 P4 part b

function [U, S, V] = LRsvd(X, Y)
    [Q_x, R_x] = qr(X, "econ");
    [Q_y, R_y] = qr(Y, "econ");
    B = R_x * R_y.';
    [U_b, S, V_b] = svd(B);
    U = Q_x * U_b;
    V = Q_y * V_b;
end
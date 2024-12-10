% AMATH 584 HW4 Tianbo ZHang
% The following is the implementation of Fast Toeplitz rank k svd
function [Ur, Sr, Vr] = toepsvd(ct, rt, k)
    % Generate toeplitz matrix T
    T = toeplitz(ct, rt);
    T = full(T);
    [m, ~] = size(T);

    % Generate the random matrix
    G = rand(m,2*k);
    % Compute Y using toepmatvec and compute Q
    Y= toepmatvec(ct, rt, G);
    [Q, ~] = qr(Y, 0);
    B = toepmatvec(ct, rt, Q);
    B = B.';
    [uu, s, v] = svd(B, 'econ');

    % Chop away silent things
    u = Q*uu;
    Ur = u(:, 1:k);
    Sr = s(1:k, 1:k);
    Vr = v(:, 1:k);
end
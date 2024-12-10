% AMATH 584 HW4 Tianbo ZHang
% The following is the implementation of Fast Toeplitz Matvec
function Y = toepmatvec(ct,rt,V)
    m = length(ct);
    % Get ct and rt's extended version
    rt = reshape(rt, [m,1]);
    ct_extended = [ct; ct(1); flip(rt(2:end))];
    [~, b] = size(V);
    m = length(ct_extended);
    D = spdiags(fft(ct_extended), 0, m,m);
    V = [V; zeros(m/2,b)];
    Y = ifft(full(D*(fft(V))));
    Y = Y(1:m/2,:);
end

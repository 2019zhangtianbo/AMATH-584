A = [1 1 1 1 1 1;
     1 1 1 1 1 1;
     1 1 1 1 1 1;
     1 1 1 1 1 1;
     1 1 1 1 1 1];
[u_a, s_a, v_a] = svd(A);

B = [0 0 1 1 0 0;
     0 0 1 1 0 0;
     1 1 1 1 1 1;
     1 1 1 1 1 1;
     0 0 1 1 0 0;
     0 0 1 1 0 0];
[u_b, s_b, v_b] = svd(B);

C = [1 1 1 0 0 0;
     1 1 1 1 1 1;
     0 0 0 0 0 0;
     1 1 1 1 1 1;
     0 0 0 0 0 0;
     1 1 1 1 1 1];
[u_c, s_c, v_c] = svd(C);

D = [1 0 0 0 0 1;
     0 1 0 0 1 0;
     0 0 1 1 0 0;
     0 0 1 1 0 0;
     0 1 0 0 1 0;
     1 0 0 0 0 1];
[u_d, s_d, v_d] = svd(D);

E = [1 1 0 0 0 0;
     1 1 1 0 0 0;
     0 1 1 1 0 0;
     0 0 1 1 1 0;
     0 0 0 1 1 1;
     0 0 0 0 1 1];
[u_e, s_e, v_e] = svd(E);

sv1 = diag(s_a);
fprintf('Diagonal of matrix s of A:\n');
disp(sv1);

sv2 = diag(s_b);
fprintf('Diagonal of matrix s of B:\n');
disp(sv2);

sv3 = diag(s_c);
fprintf('Diagonal of matrix s of C:\n');
disp(sv3);

sv4 = diag(s_d);
fprintf('Diagonal of matrix s of D:\n');
disp(sv4);

sv5 = diag(s_e);
fprintf('Diagonal of matrix s of E:\n');
disp(sv5);

m = 500;
B = zeros(m,m);
for j = 1:m
    for k = 1:m
        xj = (j - 1) / m;
        yk = (k + 1/2) / m;
        B(j,k) = 1 / (xj - yk);
    end
end

surf(B); 
shading flat; 
view(3); 
colorbar;
shg;
title('Matrix B');
xlabel('x');
ylabel('y');
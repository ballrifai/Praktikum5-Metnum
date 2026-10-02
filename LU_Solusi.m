function x = LU_Solusi(A, b)
fprintf('Hasil dekomposisi LU\n');
[L, U, P] = LU_fwdelim(A);
fprintf('Matriks L:\n');
disp(L)
fprintf('Matriks U:\n');
disp(U)
fprintf('Bukti A = LU, hasil L*U:\n');
disp(P' * L * U)
[n, m] = size(L);
b = P * b;
y = zeros(n, 1);
x = zeros(n, 1);
y(1) = b(1) / L(1, 1);
for i = 2 : n
    y(i) = (b(i) - L(i, 1:i-1) * y(1:i-1)) / L(i, i);
end
fprintf('Hasil y dari Ly = b:\n');
disp(y)
x(n) = y(n) / U(n, n);
for i = n-1 : -1 : 1
    x(i) = (y(i) - U(i, i+1:n) * x(i+1:n)) / U(i, i);
end
fprintf('Hasil X dari Ux = y:\n');
disp(x)
end

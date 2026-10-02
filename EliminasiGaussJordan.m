function x = EliminasiGaussJordan(A, b)
[n, l] = size(A);
for i = 1 : n-1
    [pivot, k] = max(abs(A(i:n, i)));
    k = k + i - 1;
    if abs(A(i, i)) < 1e-8 * pivot
        temp1 = A(i, :);
        temp2 = b(i, :);
        A(i, :) = A(k, :);
        b(i, :) = b(k, :);
        A(k, :) = temp1;
        b(k, :) = temp2;
    end
    if abs(A(i, i)) < 1e-12
        error('Matriks singular, solusi tidak tunggal');
    end
    for h = i+1 : n
        m = A(h, i) / A(i, i);
        A(h, :) = A(h, :) - m * A(i, :);
        b(h, :) = b(h, :) - m * b(i, :);
    end
end
if abs(A(n, n)) < 1e-12
    error('Matriks singular, solusi tidak tunggal');
end
fprintf('Hasil forward elimination:\n');
disp([A b])
for i = 2 : n
    for h = 1 : i-1
        m = A(h, i) / A(i, i);
        A(h, :) = A(h, :) - m * A(i, :);
        b(h, :) = b(h, :) - m * b(i, :);
    end
end
fprintf('Matriks augmented saat A diagonal:\n');
disp([A b])
for i = 1 : n
    b(i, :) = b(i, :) / A(i, i);
    A(i, :) = A(i, :) / A(i, i);
end
fprintf('Matriks augmented akhir (A menjadi matriks identitas):\n');
disp([A b])
x = b;
fprintf('Hasil X:\n');
disp(x)

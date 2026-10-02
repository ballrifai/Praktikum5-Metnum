
clc; clear;
format rat

A = [2 1 -1; 4 3 1; -2 1 2];
b = [3; 9; 4];

fprintf('1. ELIMINASI GAUSS (EliminasiGauss.m)\n');
x1 = EliminasiGauss(A, b);

fprintf('\n2. ELIMINASI GAUSS-JORDAN (EliminasiGaussJordan.m)\n');
x2 = EliminasiGaussJordan(A, b);

fprintf('\n3. DEKOMPOSISI LU (LU_Solusi.m)\n');
x3 = LU_Solusi(A, b);

fprintf('\nPERBANDINGAN HASIL X\n');
fprintf('Kolom 1: Gauss | Kolom 2: Gauss-Jordan | Kolom 3: LU\n');
disp([x1 x2 x3])

format short

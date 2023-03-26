function [output] = GSinfo(A)
%   Funkcja pomocnicza do metody iteracyjnej Gaussa-Seidla zwracająca 
%   poziomy wektor z promieniem spektralnym macierzy iteracji oraz 
%   wskaźnikiem uwarunkownia macierzy współczynników.

%   A - macierz współczynników

condition =  cond(A);

L = tril(A, -1);
D = diag(diag(A));
U = triu(A, 1);
B = -(L + D)^(-1) * U;
rho_B = max(abs(eig(B)));

output = [rho_B condition];
end
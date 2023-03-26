function [output] = blokoweGS(A, b, Nmax, prec)
%   Blokowa medoda Gaussa-Seidela. Zwraca macierz z rozwiązaniem oraz
%   błędem względnym. Przy udanym przybliżeniu wypisuje liczbę wykonanych
%   iteracji.

%   A - macierz współczynników
%   b - wektor wyrazów wolnych
%   Nmax - maksymalna liczba iteracji
%   prec - żądana precyzja

n = size(A,1);
p = n/3;

A12 = A(1:p, p+1:2*p);
A22 = A(2*p+1:3*p, 2*p+1:3*p);
A23 = A(2*p+1:3*p, p+1:2*p);
b1 = b(1:p, 1);
b2 = b(p+1:2*p, 1);
b3 = b(2*p+1:3*p, 1);
X = zeros(n, Nmax);
flag = 0;

for i = 2:Nmax

    X(1:p, i) = b1 - A12 * X(p+1:2*p, i-1);
   
    X(p+1:2*p, i) = GECP(A22, -b2 + A12 * X(1:p, i) + A23 * X(2*p+1:3*p, i-1));

    X(2*p+1:3*p, i) = GECP(A22, b3 - A23 * X(p+1:2*p, i));

    last = i;
    if norm(X(:, i) - X(:,i-1)) < prec
        flag = 1;
        break
    end
end

G = zeros(n,last);
for i=1:last
    G(:,i) = abs((X(:,i) - X(:, last)) ./ X(:, last));
end


X = X(:,last);
if flag == 0
    fprintf("Przekroczono limit iteracji!")
    output = [-1 -1];
else
    fprintf("Osiągnięto żądaną dokładność w %d iteracji.", last)
    x = 1:last;
    y = G;
    plot(x,y)
    xlabel('iteracje')
    ylabel('błąd względny w stosunku do wartości końcowej')
    title('Zmiana błędu względnego')
    output = X;
end

end
function [integralMatrix] = kwadraturaTrapezowWektorowo(A)
%   Wykonuje przybliżenie wartości serii całek przy użyciu złożonej
%   kwadratury trapezów
%
%   Przyjmuje komórkę, gdzie każdy wiersz to pojedyńczy zestaw argumentów:
%   funkcja, początek przedziału całkowania, koniec przedziału
%   całkowania, początkowa liczba podziałów oraz wymagana dokładność.
%   Zwraca wyniki w postaci pionowej macierzy.
mySize = size(A);
n = mySize(1);

integralMatrix = zeros(n, 1);

for i = 1:size(A)
    fun = A{i,1};
    a = A{i,2};
    b = A{i,3};
    m = A{i,4};
    delta =  A{i,5};
    integralMatrix(i) = kwadraturaTrapezow(fun, a, b, m, delta);
end
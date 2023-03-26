function [przyblizenie] = pojedynczePrzyblizenie(fun, a, b, m)
%   Funkcja wyznacza brzyblizoną wartość całki przy użyciu złożonej
%   kwadratury trapezów.
%
%   Przyjmuje funkcje, początek przedziału całkowania, koniec przedziału
%   całkowania oraz liczbę podziałów.

H = (b-a)/m;
przyblizenie = (fun(a) + fun(b))/2;
for i = 1 : m-1
    przyblizenie = przyblizenie + fun(a + i*H); 
end
przyblizenie = przyblizenie * H;

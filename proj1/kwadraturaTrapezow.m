function [integral] = kwadraturaTrapezow(fun, a, b, m, delta)
%   Funkcja przybliża wartość całki złożoną kwadraturą trapezów z zadaną
%   dokładnością.
%   
%   Przyjmuje funkcje, początek przedziału całkowania, koniec przedziału
%   całkowania, początkową liczbę podziałów oraz wymaganą dokładność.

p = pojedynczePrzyblizenie(fun, a, b, m);
m = m * 2;

pNext = pojedynczePrzyblizenie(fun, a, b, m);
m = m * 2;

while abs(p-pNext) > delta
    p = pNext;

    pNext = pojedynczePrzyblizenie(fun, a, b, m);
    m = m * 2;
end

integral = pNext;

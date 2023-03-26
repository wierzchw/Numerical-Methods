function [X] = GECP(A,b)
%   Funkcja pomocnicza do metody iteracyjnej Gaussa-Seidla implementująca
%   metode eliminacji Gaussa z pełnym wyborem elementów głównych.

%   A - macierz współczynników
%   b - wektor wyrazów wolnych

Ab = [A b];
N = length(b);
P = eye(N);
X =  zeros(N,1);

for j = 1:N

    [~, maxi] = max(abs(Ab(j:N, j:N)));
    [~, maxj] = max(max(abs(Ab(j:N, j:N))));
    maxi = maxi(maxj); 
    maxi = maxi + j - 1;
    maxj = maxj + j - 1;
    maxv = Ab(maxi, maxj);

    if maxi~=j
        temp = Ab(maxi, :);
        Ab(maxi, :) = Ab(j, :);
        Ab(j, :) = temp;
    end

    if maxj~=j
        temp = Ab(:, maxj);
        Ab(:, maxj) = Ab(:, j);
        Ab(:, j) = temp;

        temp = P(:, maxj);
        P(:, maxj) = P(:, j);
        P(:, j) = temp;
    end
    
    for i=j+1:N
        if Ab(i, j) ~= 0
            Ab(i,:) = Ab(i,:) - (Ab(i, j)/maxv) * Ab(j,:);
        end
    end

end

for j = N:-1:1 

    for i = N:-1:j

        if i ~= j
            Ab(j,N+1) = Ab(j,N+1) - Ab(j,i)*X(i);
            Ab(j,i) = 0;
        end

    end

    X(j) = Ab(j,N+1)/Ab(j,j);
end

X = (P*X);
end

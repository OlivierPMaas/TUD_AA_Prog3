function [B] = cholesky(Y)
    % Performs Cholesky algorithm on matrix resulting in B such that:
    % Y = B' * B
    [Q, A] = eig(value(Y));
    B = Q * sqrt(A);
    B = B';
end


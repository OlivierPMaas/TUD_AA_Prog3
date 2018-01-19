function [S1, S2, weight] = main(filename)
    % Maxcut approximation!
    [Y, obj, n, solvertime] = sdp_maxcut(filename);
    B = cholesky(Y);
    weight = -1;
    while weight < 0.878 * obj
        r = random_vector(n);
        [S1, S2] = gw_round(B, r);
        weight = cutweight(S1, S2, filename);
    end
end


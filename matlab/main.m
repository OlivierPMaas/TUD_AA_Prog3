function [S1, S2, lowbound, weight, sdpweight, trials] = main(filename)
    % Maxcut approximation
    
    % Solve SDP
    [Y, obj, n, solvertime] = sdp_maxcut(filename);
    B = cholesky(Y);
    
    % Try cut based on random vector
    % until we've found one that is good enough.
    weight = -1;
    % Initialize lowbound to the highest it could possibly be.
    lowbound = obj;
    trials = 0;
    while weight < 0.87856 * obj
        r = random_vector(n);
        [S1, S2] = gw_round(B, r);
        weight = cutweight(S1, S2, filename);
        lowbound = min(lowbound, weight);
        trials = trials + 1;
    end
    % ...But we do want at least 5 datapoints to get an experimental lower
    % bound of the resulting weight.
    while trials < 5
        r = random_vector(n);
        [S1, S2] = gw_round(B, r);
        lowbound = min(lowbound, cutweight(S1, S2, filename));
        trials = trials + 1;
    end
    
    % Rename cut partitioning to fit GraphGenerator graphs.
    for idx = 1:length(S1)
        S1(idx) = S1(idx)-1;
    end
    for idx = 1:length(S2)
        S2(idx) = S2(idx)-1;
    end
    
    sdpweight = obj;
end


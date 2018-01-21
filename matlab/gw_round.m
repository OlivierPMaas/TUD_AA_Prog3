function [S1, S2] = gw_round(B, r)
    % Rounding step of the algorithm from Goemans and Williamson, 1995
    n = length(B);
    S1 = [];
    S2 = [];
    for i = 1:n
        if dot(B(:,i), r) >= 0
            S1 = [S1, i]; % It's on one side of the cut
        else
            S2 = [S2, i]; % It's on the other side of the cut
        end
    end
end
